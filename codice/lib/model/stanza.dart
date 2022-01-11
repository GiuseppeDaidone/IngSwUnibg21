import 'package:codice/database/oggettiDB.dart';
import 'package:codice/functions/creazione_partita.dart';
import 'package:codice/model/domanda.dart';
import 'package:codice/model/nemico.dart';
import 'package:codice/model/oggetto.dart';
import 'package:codice/model/partita.dart';
import 'azione.dart';

class Stanza {
  // L'index della stanza viene fornito quando viene creata la mappa
  late int index;

  // Se bool = true allora:
  // se sono in combattimento -> la stringa associata è il testo di una domanda
  // se non sono in combattimento -> devo cambiare l'immagine mostrata nella pagina
  final List<Map<String, bool>> dialogoStanza;
  final List<String> immagini;
  final List<Azione> azioniDisponibili;
  late Oggetto oggettoStanza;

  // Se la stanza non ha un nemico l'attributo è null
  Nemico? nemico;

  // Index dell'immagine e del dialogo attualmente mostrati nella UI
  int currentImageIndex = 0;
  int currentDialogoIndex = 0;

  Stanza({
    required this.azioniDisponibili,
    required this.dialogoStanza,
    required this.immagini,
  });

  // Questo metodo viene chiamato quando la stanza è inserita dento una mappa
  // In questo metodo:
  // - Viene associato un index alla stanza in base alla posizione nella mappa
  // - Viene aggiunto un oggetto alla stanza
  // - Viene creato un nemico (se dialogoStanza e azioniDisponibili sono vuoti)
  void setIndex(int idx) {
    // Imposto l'index della pagina in base dove essa si trova nella mappa della partita corrente
    index = idx;

    // Aggiungo oggetto
    oggettoStanza = OggettiDB().getOggetto();

    // Se ho un nemico lo creo, poi aggiungo il suo dialogo al dialogo stanza
    if (dialogoStanza.isEmpty && azioniDisponibili.isEmpty) {
      nemico = CreazionePartita().creaNemico(index);

      // Scorro il dialogo del combattimento, lo aggiungo al dialogo della pagina e inoltre aggiungo anche il testo delle domande e i
      // booleani che indicano quando devono essere mostrate le domande
      for (int i = 0; i < nemico!.dialogoCombattimento.length; i++) {
        // Se ho un bool = true, allora ho una domanda. Aggiungo il testo domanda al dialogo e pongo bool = true
        if (nemico!.dialogoCombattimento[i].values.first) {
          dialogoStanza.add({
            nemico!.listaDomande[nemico!.indexDomandaCorrente].testoDomanda:
                true
          });
          // aggiorno index domanda
          nemico!.nextDomanda();
        }
        // Se invece non ho una domanda allora aggiungo il testo del dialogo al dialogo della stanza e metto bool = false
        else {
          dialogoStanza.add(
            {nemico!.dialogoCombattimento[i].keys.first: false},
          );
        }
      }
      // riporto index domanda a zero, in questo modo quando ci ritorno per prendere la lista azioni sono sincronizzato
      nemico!.resetIndexDomanda();
    }
  }

  //TODO: capire se posso integrare questo metodo con increaseDialogoCOmbattimento()
  // Metodo per scorrere il dialogo chiamato quando NON CI SONO combattimenti
  // Se viene ritornato true allora devo passare alla stanza dopo
  bool increaseDialogoIndex(bool isPulsanteRisposta, Partita partita) {
    if (dialogoStanza[currentDialogoIndex].values.first &&
        !isPulsanteRisposta) {
      print("Rispondere usando i pulsanti!");
      return false;
    }
    if ((currentDialogoIndex + 1) >= dialogoStanza.length) {
      print("DIALOGO STANZA FINITO");

      partita.goStanzaSuccessiva();
      return true;
    } else {
      currentDialogoIndex++;
      print("CAMBIO DIALOGO");

      // Controllo se devo cambiare immagine
      if (dialogoStanza[currentDialogoIndex].values.single) {
        currentImageIndex++;
        print("CAMBIO IMMAGINE");
      }
      return false;
    }
  }

  // Metodo per scorrere il dialogo chiamato quando CI SONO combattimenti
  bool increaseDialogoCombattimento(bool isPulsanteRisposta, Partita partita) {
    // Se sono dentro una domanda e viene premuto il gestureDetector non vado avanti! avanzo solo se viene risposta la domanda!
    if (dialogoStanza[currentDialogoIndex].values.first &&
        !isPulsanteRisposta) {
      print("Rispondere usando i pulsanti!");
      return false;
    }

    // Se viene risposto ad una domanda oppure non c'è una domanda a cui rispondere procedo con il dialogo anche con gestureDetector
    else {
      if ((currentDialogoIndex + 1) >= dialogoStanza.length) {
        print("DIALOGO STANZA FINITO");
        partita.goStanzaSuccessiva();
        return true;
      } else {
        currentDialogoIndex++;

        // Se il nuovo dialogo mostrato è una domanda faccio apparire i pulsanti delle risposte
        if (dialogoStanza[currentDialogoIndex].values.first) {
          creazioneAzioni();
        }

        // altrimeni pulisco la lista delle azioni
        else {
          azioniDisponibili.clear();
        }

        print("CAMBIO DIALOGO");
      }
      return false;
    }
  }

  // Trasformo le risposte delle domande in Azioni e li aggiungo alla lista azioniDisponibili
  void creazioneAzioni() {
    // recupero domanda corrente
    Domanda domandaCorrente =
        nemico!.listaDomande[nemico!.indexDomandaCorrente];

    // Creo Azioni Risposte
    for (int i = 0; i < domandaCorrente.risposte.length; i++) {
      azioniDisponibili.add(
        Azione(
            f1: () {
              // Se la risposta è quella corretta:
              if (domandaCorrente.soluzione == domandaCorrente.risposte[i]) {
                print("SOLUZIONE CORRETTA");
              }
              // Se la risposta è quella errata:
              else {
                print("SOLUZIONE ERRATA");
              }
            },
            titoloPulsante: domandaCorrente.risposte[i]),
      );
    }
    // aggiorno index domanda corrente
    nemico!.nextDomanda();
  }
}
