import 'package:codice/database/domandeDB.dart';
import 'package:codice/database/stanzeDB.dart';
import 'package:codice/model/combattimento.dart';
import 'package:codice/model/nemico.dart';
import 'package:codice/model/stanza.dart';

class CreazionePartita {
  // Genero la mappa pescando in modo random le stanze dal database: stanzeDB
  List<Stanza> creaMappa() {
    List<Stanza> mappa = [];

    print("INZIO CREAZIONE MAPPA");

    for (int i = 0; i < 10; i++) {
      // Mappa Iniziale
      if (i == 0) {
        mappa.add(StanzeDB().getStanzaIniziale());
        // Associo alla mappa l'index della posizione in cui si trova dentro la mappa.
        mappa.last.setIndex(i);
      }

      // Mappe Combattimento
      else if (i % 3 == 0) {
        mappa.add(StanzeDB().getStanzaCombattimento());
        mappa.last.setIndex(i);
      }

      // Mappa Esplorazione
      else {
        mappa.add(StanzeDB().getStanzaEsplorazione());
        mappa.last.setIndex(i);
      }
    }

    return mappa;
  }

  // Quando una in cui è presente un combattimento viene creata, il costruttore chiama questa funzione genere il combattimento
  Combattimento creaCombattimento(int indexStanza) {
    // In base all'index della stanza, verrà creato un combattimento più o meno difficile. Si andrà quindi a controllare l'index
    // ed in base a quello si decide da quale lista domande pescare, quante pescarne e quale nemico associare al combattimento
    print("CREO COMBATTIMENTO");

    // I dialoghi rimarranno sempre gli stessi per gli stessi nemici, ma le domande saranno prese a caso dal database
    if (indexStanza >= 0 && indexStanza <= 3) {
      return Combattimento(
        dialogoCombattimento: [
          {"Hey Come va": false},
          {"Sei pronto alla domanda?": false},
          {"testoDomanda": true},
          {"ed ora?": false},
          {"ecco un altra domanda": true},
          {"bravo 30": false}
        ],
        // Prendo domande dal database !! stare attenti che ci sia coerenza con il numero di domande indicato nel dialogoCombattimento!!
        domande: DomandeDB().listaDomande,
        nemico: Nemico(),
      );
    } else if (indexStanza >= 4 && indexStanza <= 6) {
      return Combattimento(
        dialogoCombattimento: [
          {"Hey Come va": false},
          {"Sei pronto alla domanda?": false},
          {"testoDomanda": true}
        ],
        domande: [],
        nemico: Nemico(),
      );
    } else {
      return Combattimento(
        dialogoCombattimento: [
          {"Hey Come va": false},
          {"Sei pronto alla domanda?": false},
          {"testoDomanda": true}
        ],
        domande: [],
        nemico: Nemico(),
      );
    }
  }
}
