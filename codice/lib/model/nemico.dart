import 'package:codice/database/domandeDB.dart';
import 'package:codice/functions/creazione_partita.dart';
import 'package:codice/model/domanda.dart';
import 'package:codice/model/partita.dart';
import 'package:codice/model/personaggio.dart';
import 'package:codice/model/scudo.dart';
import 'package:codice/model/stanza.dart';
import 'package:provider/provider.dart';
import 'azione.dart';

class Nemico {
  Nemico(
      {required this.nome,
      required this.immaginiNemico,
      required this.livello,
      required this.disciplina,
      required this.immagineSfondo,
      required this.dialogoCombattimento})
      : listaDomande =
            CreazionePartita().creaDomandeNemico(livello, disciplina);

  final String nome;
  final List<String> immaginiNemico;
  final String immagineSfondo;
  // Livello indica la difficoltà del nemico
  final LivelloNemico livello;
  final Disciplina disciplina;
  // La lista viene creata dal costruttore, che pesca domande con stessa disciplina e difficoltà del nemico, dal database.
  final List<Domanda> listaDomande;
  // Se bool = true allora la string è una domanda
  // NB: Il dialogo è fisso per ogni nemico. Le domande invece cambiano da partita a partita
  final List<Map<String, bool>> dialogoCombattimento;
  // Danno che il nemico infligge in caso di domanda sbagliata
  int danno = 10;
  late StatoNemico statoNemico;
  String dialogoCorrente = "";

  final List<Azione> azioniDisponibili = [];

  // Index della domanda attualmente visualizzata
  int indexDomandaCorrente = 0;
  int indexImmagineCorrente = 0;
  int indexDialogoCorrente = 0;

  void changeStatoNemico(StatoNemico st, {context}) {
    switch (st) {
      case StatoNemico.TRISTE:
        statoNemico = st;
        indexImmagineCorrente = 3;
        dialogoCorrente = "RISPOSTA CORRETTA!";
        azioniDisponibili.clear();
        break;

      case StatoNemico.DOMANDA:
        statoNemico = st;
        indexImmagineCorrente = 1;
        dialogoCorrente = listaDomande[indexDomandaCorrente].testoDomanda;
        creazioneAzioni(listaDomande[indexDomandaCorrente], context: context);
        Provider.of<Partita>(context, listen: false).aumentaDomandeRisposte();
        break;

      case StatoNemico.SCONFITTO:
        statoNemico = st;
        indexImmagineCorrente = 4;
        dialogoCorrente = "MI HAI SCONFITTO MALEDETTO!";

        break;

      case StatoNemico.RISATA:
        statoNemico = st;
        indexImmagineCorrente = 2;
        dialogoCorrente = "RISPOSTA ERRATA!";
        Provider.of<Partita>(context, listen: false).aumentaDomandeSbagliate();
        azioniDisponibili.clear();
        break;

      case StatoNemico.DIALOGO:
        statoNemico = st;
        indexImmagineCorrente = 0;
        dialogoCorrente = dialogoCombattimento[indexDialogoCorrente].keys.first;
    }
  }

  void prossimoDialogo(Partita partita, context) {
    // Se ho sbagliato la domanda precedente ne chiedo un'altra al nemico
    if (statoNemico == StatoNemico.RISATA) {
      changeStatoNemico(StatoNemico.DOMANDA, context: context);
      indexDomandaCorrente++;
    } else {
      // Controllo che ci sia ancora del dialogo
      if (indexDialogoCorrente + 1 < dialogoCombattimento.length) {
        indexDialogoCorrente++;
        // Se il dialogo nuovo deve mostrare anche domanda, mostro creo le azioni, le mostro e cambio l'immagine nemico
        if (dialogoCombattimento[indexDialogoCorrente].values.first) {
          changeStatoNemico(StatoNemico.DOMANDA, context: context);
          indexDomandaCorrente++;
        }
        // Cambio solo il dialogo
        else {
          changeStatoNemico(StatoNemico.DIALOGO);
        }
      } else {
        partita.goStanzaSuccessiva(context: context);
      }
    }
  }

  void creazioneAzioni(Domanda domanda, {context}) {
    // Creo Azioni Risposte
    for (int i = 0; i < domanda.risposte.length; i++) {
      azioniDisponibili.add(
        Azione(
            f1: ({Stanza? s, Personaggio? p}) {
              // Se la risposta è quella corretta:
              if (domanda.soluzione == domanda.risposte[i]) {
                print("SOLUZIONE CORRETTA");
                changeStatoNemico(StatoNemico.TRISTE, context: context);
              }
              // Se la risposta è quella errata:
              else {
                print("SOLUZIONE ERRATA");
                changeStatoNemico(StatoNemico.RISATA, context: context);
                // Se sbaglio risposta aggiunto una nuova domanda alla lista
                listaDomande.add(DomandeDB().getDomanda());

                if (p!.oggettoEquipaggiato is Scudo) {
                  p.eliminaOggetto(p.oggettoEquipaggiato);
                  p.equipaggiaOggetto(null);
                } else {
                  p.decrSalute(danno, context);
                }
              }
            },
            titoloPulsante: domanda.risposte[i]),
      );
    }
  }
}

// DISCIPLINE LEGATE ALLE DOMANDE ED AI NEMICI
enum Disciplina { MATEMATICA, DATABASE, FISICA, EMBEDDED }

// Indica la difficoltà del nemico. In base a questo dipendono la difficoltà delle domande
enum LivelloNemico { BASSO, MEDIO, ALTO }

// Stato in cui si trova il nemico, in base a questo cambiano le immagini mostrate
enum StatoNemico { DIALOGO, DOMANDA, RISATA, TRISTE, SCONFITTO }
