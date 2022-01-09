import 'package:codice/database/oggettiDB.dart';
import 'package:codice/database/oggettiDB.dart';
import 'package:codice/functions/creazione_partita.dart';
import 'package:codice/model/combattimento.dart';
import 'package:codice/model/domanda.dart';
import 'package:codice/model/oggetto.dart';
import 'package:codice/model/partita.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'azione.dart';

class Stanza {
  // L'index della stanza viene fornito quando viene creata la mappa al momento della creazine dell'istanza partita.
  late int _index;
  // Ogni volta che il bool = true, significa che bisogna mostrare l'immagine successiva sulla pagina.
  final List<Map<String, bool>> dialogoStanza;
  final List<String> immagini;
  // Ogni azione corrisponde ad un bottone
  final List<Azione> azioniDisponibili;
  late Oggetto oggettoStanza;
  // Se la stanza non ha un combattimento, esso è null
  Combattimento? combattimento;
  // Quando la stanza viene creata viene deciso se ci saranno combattimenti o meno
  final bool isCombattimentoPresente;
  int currentImageIndex = 0;
  int currentDialogoIndex = 0;

  Stanza({
    required this.azioniDisponibili,
    required this.dialogoStanza,
    required this.immagini,
    this.isCombattimentoPresente = false,
  });

  // Quando una stanza viene inserita nella mappa, gli viene associato l'index della posizione e vengono creati gli eventuali
  // combattimenti
  void setIndex(int idx) {
    // prendo un oggetto a caso da quelli disponibili nel database
    print("AGGIUNGO OGGETTO + INDEX ALLA STANZA");
    oggettoStanza = OggettiDB().getOggetto();

    // Imposto l'index della pagina in base dove essa si trova nella mappa della partita corrente
    _index = idx;

    if (isCombattimentoPresente) {
      combattimento ??= CreazionePartita().creaCombattimento(_index);
      // Scorro il dialogo del combattimento, lo aggiungo al dialogo della pagina e inoltre aggiungo anche il testo delle domande e i
      // booleani che indicano quando devono essere mostrate le domande
      for (int i = 0; i < combattimento!.dialogoCombattimento.length; i++) {
        // Se ho un bool = true, allora ho una domanda. Aggiungo il testo domanda al dialogo e pongo bool = true
        if (combattimento!.dialogoCombattimento[i].values.first) {
          dialogoStanza.add({
            combattimento!
                .domande[combattimento!.indexDomandaCorrente].testoDomanda: true
          });
          // aggiorno index domanda
          combattimento!.nextDomanda();
        }
        // Se invece non ho una domanda allora aggiungo il testo del dialogo con il nemico al dialogo della stanza e metto bool = false
        else {
          dialogoStanza.add(
            {combattimento!.dialogoCombattimento[i].keys.first: false},
          );
        }
      }
      // riporto index domanda a zero, in questo modo quando ci ritorno per prendere la lista azioni sono sincronizzato
      combattimento!.resetIndexDomanda();
    }
  }

  void increaseDialogoIndex() {
    print(dialogoStanza.length);

    if ((currentDialogoIndex + 1) >= dialogoStanza.length) {
      print("DIALOGO STANZA FINITO");
    } else {
      currentDialogoIndex++;
      print("CAMBIO DIALOGO");

      // Controllo se devo cambiare immagine
      if (dialogoStanza[currentDialogoIndex].values.single) {
        currentImageIndex++;
        print("CAMBIO IMMAGINE");
      }
    }
  }

  void increaseDialogoCombattimento(bool isPulsanteRisposta) {
    // Se sono dentro una domanda, posso andare avanti solamente rispondendo con i pulsanti
    if (dialogoStanza[currentDialogoIndex].values.first &&
        !isPulsanteRisposta) {
      print("Rispondere usando i pulsanti!");
    }
    // Se non è presente il testo di una domanda permetto di skippare dialogo cliccando
    else {
      if ((currentDialogoIndex + 1) >= dialogoStanza.length) {
        print("DIALOGO STANZA FINITO");
      } else {
        currentDialogoIndex++;
        // Se il nuovo dialogo mostrato è una domanda faccio apparire i pulsanti delle risposte
        if (dialogoStanza[currentDialogoIndex].values.first) {
          creazioneDomande();
        }
        // altrimeni pulisco la lista delle azioni
        else {
          azioniDisponibili.clear();
        }

        print("CAMBIO DIALOGO");
      }
    }
  }

  void creazioneDomande() {
    // recupero domanda corrente
    Domanda domandaCorrente =
        combattimento!.domande[combattimento!.indexDomandaCorrente];

    dialogoStanza.add({});

    // Creo pulsanti risposte
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
    combattimento!.nextDomanda();
  }
}
