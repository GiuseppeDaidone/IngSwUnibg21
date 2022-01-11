import 'dart:math';

import 'package:codice/model/azione.dart';
import 'package:codice/model/stanza.dart';

// Questa classe simula la presente di un database dove sono contenuti tutti i modelli delle classi disponibili del gioco
// NB: per le stanze che hanno un combattimento, azioniDisponibili[] e dialogoStanza[] devono essere vuoti!!

class StanzeDB {
  Stanza getStanzaIniziale() {
    // Ritorno una stanza casuale tra quelle iniziali
    return stanzeIniziali[Random().nextInt(stanzeIniziali.length)];
  }

  Stanza getStanzaCombattimento() {
    return stanzeCombattimento[Random().nextInt(stanzeCombattimento.length)];
  }

  Stanza getStanzaEsplorazione() {
    return stanzeEsplorazione[Random().nextInt(stanzeEsplorazione.length)];
  }

  // Lista di stanze iniziali
  List<Stanza> stanzeIniziali = [
    Stanza(
      azioniDisponibili: [
        Azione(
            f1: () {
              print("azione1");
            },
            titoloPulsante: "Azione1"),
        Azione(
            f1: () {
              print("azione2");
            },
            titoloPulsante: "Azione2"),
      ],
      dialogoStanza: [
        {"Stanza iniziale dialogo": false},
        {"dialogo2": false},
        {"dialogo3": true}
      ],
      immagini: ["images/dun.jpg", "images/homegif.gif"],
    ),
  ];

  // Lista di stanze in cui si può solo esplorare
  List<Stanza> stanzeEsplorazione = [
    // STANZA 1
    Stanza(
      azioniDisponibili: [
        Azione(
            f1: () {
              print("azione1");
            },
            titoloPulsante: "Azione1"),
        Azione(
            f1: () {
              print("azione1");
            },
            titoloPulsante: "Azione1")
      ],
      dialogoStanza: [
        {"stanza esplorazione dialogo": false},
        {"dialogo2": false},
        {"dialogo3": true}
      ],
      immagini: ["images/dun.jpg", "images/homegif.gif"],
    ),
  ];

  // Lista di stanze in cui è presente un combattimento
  List<Stanza> stanzeCombattimento = [
    // STANZA 1
    Stanza(
      azioniDisponibili: [],
      dialogoStanza: [],
      immagini: ["images/dun.jpg", "images/homegif.gif"],
    ),
  ];
}
