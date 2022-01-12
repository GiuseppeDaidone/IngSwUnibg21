import 'package:codice/database/oggettiDB.dart';
import 'package:codice/functions/creazione_partita.dart';
import 'package:codice/model/domanda.dart';
import 'package:codice/model/nemico.dart';
import 'package:codice/model/oggetto.dart';
import 'package:codice/model/partita.dart';
import 'package:codice/model/personaggio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'azione.dart';

class Stanza {
  // L'index della stanza viene fornito quando viene creata la mappa
  late int index;

  // Se bool = true allora significa che devo mostrare i pulsanti delle azioni nella UI e cambiare l'immagine mostrata
  final List<Map<String, bool>> dialogoStanza;
  final List<String> immagini;
  final List<Azione> azioniDisponibili;
  late Oggetto oggettoStanza;

  // Se la stanza non ha un nemico l'attributo è null
  Nemico? nemico;

  // Index dell'immagine e del dialogo attualmente mostrati nella UI
  // NB: le immagini avanzano solamente quando appaiono dei pulsanti per un'azione sullo schermo
  int currentImageIndex = 0;
  int currentDialogoIndex = 0;

  Stanza({
    required this.azioniDisponibili,
    required this.dialogoStanza,
    required this.immagini,
  });

  // Questo metodo viene chiamato quando la stanza è inserita dentro una mappa
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

      // Scorro il dialogo del combattimento, aggiungo dialogo e testo domande al dialogo della stanza
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

  // Metodo per scorrere il dialogo
  // Se viene ritornato true allora devo passare alla stanza dopo
  bool increaseDialogoIndex(bool isPulsanteRisposta, Partita partita,
      {context}) {
    // Se è presente un pulsante azione e viene premuto il gestureDetector non vado avanti! avanzo solo se viene premuto uno dei pulsanti
    if (dialogoStanza[currentDialogoIndex].values.first &&
        !isPulsanteRisposta) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 1000),
          content:
              Text("Per avanzare rispondere usando i pulsanti disponibili"),
        ),
      );
      return false;
    }

    // Se cliccato un pulsante azione oppure non c'è una domanda a cui rispondere procedo con il dialogo o vado alla stanza successiva
    else {
      if ((currentDialogoIndex + 1) >= dialogoStanza.length) {
        partita.goStanzaSuccessiva(context: context);
        return true;
      } else {
        currentDialogoIndex++;

        if (nemico != null) {
          // Se il nuovo dialogo mostrato è una domanda faccio apparire i pulsanti delle risposte e cambio immagine
          if (dialogoStanza[currentDialogoIndex].values.first) {
            if (currentImageIndex + 1 < immagini.length) {
              currentImageIndex++;
            }
            creazioneAzioni(context: context);
          }

          // altrimeni pulisco la lista delle azioni
          else {
            azioniDisponibili.clear();
          }
        } else {
          if (dialogoStanza[currentDialogoIndex].values.first) {
            if (currentImageIndex + 1 < immagini.length) {
              currentImageIndex++;
            }
          }
        }
      }
      return false;
    }
  }

  // Trasformo le risposte delle domande in Azioni e li aggiungo alla lista azioniDisponibili
  void creazioneAzioni({context}) {
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
                Provider.of<Personaggio>(context, listen: false)
                    .decrSalute(nemico!.danno);
              }
            },
            titoloPulsante: domandaCorrente.risposte[i]),
      );
    }
    // aggiorno index domanda corrente
    nemico!.nextDomanda();
  }
}
