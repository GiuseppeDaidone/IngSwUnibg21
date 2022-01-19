import 'package:codice/database/domandeDB.dart';
import 'package:codice/functions/creazione_partita.dart';
import 'package:codice/model/domanda.dart';
import 'package:codice/model/partita.dart';
import 'package:codice/model/personaggio.dart';
import 'package:codice/model/scudo.dart';
import 'package:codice/model/spada.dart';
import 'package:codice/model/stanza.dart';
import 'package:provider/provider.dart';
import 'azione.dart';

// In questa classe sono contenute le informazioni sul nemico e le sue azioni disponibili

abstract class Nemico {
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
  // Domande con stessa disciplina e difficoltà del nemico, pescate dal database.
  final List<Domanda> listaDomande;
  // Se bool = true allora la string è una domanda
  // NB: Il dialogo è fisso per ogni nemico. Le domande invece cambiano da partita a partita
  final List<Map<String, bool>> dialogoCombattimento;
  // Danno che il nemico infligge in caso di domanda sbagliata
  late final int danno;
  late StatoNemico statoNemico;
  String dialogoCorrente = "";

  final List<Azione> azioniDisponibili = [];

  // Index della domanda attualmente visualizzata
  int indexDomandaCorrente = 0;
  int indexImmagineCorrente = 0;
  int indexDialogoCorrente = 0;

  // Questa funzione definisce il danno del nemico basato sul suo livello. E' differente per boss e scagnozzi
  void setDannoNemico() {}

  // Questa funzione gestisce il cambiamento di stato del nemico
  void changeStatoNemico(StatoNemico st, {context}) {
    switch (st) {
      case StatoNemico.TRISTE:
        statoNemico = st;
        indexImmagineCorrente = 3;
        dialogoCorrente = "RISPOSTA CORRETTA!";
        // pulisco lista azioni disponibili
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

  // Questa funzione vine chiamata quando voglio avanzare con lo stato del nemico
  void prossimoDialogo(Partita partita, context) {
    // Se ho sbagliato la domanda precedente il nemico ne chiede un'altra
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
        if (statoNemico == StatoNemico.SCONFITTO) {
          partita.goStanzaSuccessiva(truecontext: context);
        }
        changeStatoNemico(StatoNemico.SCONFITTO);
      }
    }
  }

  // Questa funzione trasforma le risposte alle domande in pulsanti premibili. Ad ogni pulsante associa anche l'evento per quando viene premuto
  void creazioneAzioni(Domanda domanda, {context}) {
    for (int i = 0; i < domanda.risposte.length; i++) {
      azioniDisponibili.add(
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            // RISPOSTA CORRETTA
            if (domanda.soluzione == domanda.risposte[i]) {
              changeStatoNemico(StatoNemico.TRISTE, context: context);
            }

            // RISPOSTA ERRATA
            else {
              // Se ho uno scudo non perdo salute ma non avanzo con le domande
              if (p!.oggettoEquipaggiato is Scudo) {
                p.eliminaOggetto(p.oggettoEquipaggiato);
                p.equipaggiaOggetto(null);

                changeStatoNemico(StatoNemico.RISATA, context: context);
                // Se sbaglio risposta aggiunto una nuova domanda alla lista
                listaDomande.add(DomandeDB().getDomanda());
              }

              // Se ho una spada equipaggiata, subisco danni, ma la domanda viene contata corretta e non devo ripeterla
              else if (p.oggettoEquipaggiato is Spada) {
                p.eliminaOggetto(p.oggettoEquipaggiato);
                p.equipaggiaOggetto(null);
                changeStatoNemico(StatoNemico.TRISTE, context: context);
                p.decrSalute(danno, context);
              } else {
                changeStatoNemico(StatoNemico.RISATA, context: context);
                p.decrSalute(danno, context);
                listaDomande.add(DomandeDB().getDomanda());
              }
            }
          },
          titoloPulsante: domanda.risposte[i],
        ),
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
