import 'dart:math';

import 'package:codice/model/azione.dart';
import 'package:codice/model/stanza.dart';

// Questa classe simula la presente di un database dove sono contenuti tutti i modelli delle classi disponibili del gioco

class StanzeDB {
  Stanza getStanzaIniziale() {
    // Ritorno una stanza casuale tra quelle iniziali
    return stanzeIniziali[Random().nextInt(stanzeIniziali.length)];
  }

  Stanza getStanzaCombattimento() {
    //TODO: Ritorno una stanza casuale tra quelle combattimento
    return stanzeCombattimento[Random().nextInt(stanzeCombattimento.length)];
  }

  Stanza getStanzaEsplorazione() {
    //TODO: Ritorno una stanza casuale tra quelle esplorazione
    return stanzeEsplorazione[Random().nextInt(stanzeEsplorazione.length)];
  }

  // Lista di stanze iniziali
  List<Stanza> stanzeIniziali = [
    Stanza(
      azioniDisponibili: [
        // STANZA INIZIALE 1
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
        Azione(
            f1: () {
              print("azione3");
            },
            titoloPulsante: "Azione3"),
        Azione(
            f1: () {
              print("azione4");
            },
            titoloPulsante: "Azione4")
      ],
      dialogoStanza: [
        {"stanza1": false},
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
        {"stanza1": false},
        {"dialogo2": false},
        {"dialogo3": true}
      ],
      immagini: ["images/dun.jpg", "images/homegif.gif"],
    ),

    // STANZA 2
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
        {"stanza1": false},
        {"dialogo2": false},
        {"dialogo3": true}
      ],
      immagini: ["images/dun.jpg", "images/homegif.gif"],
    ),

    // STANZA 3
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
        {"stanza1": false},
        {"dialogo2": false},
        {"dialogo3": true}
      ],
      immagini: ["images/dun.jpg", "images/homegif.gif"],
    ),

    // STANZA 4
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
        {"stanza1": false},
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
      isCombattimentoPresente: false,
      dialogoStanza: [
        {"stanza1": false},
        {"dialogo2": false},
        {"dialogo3": true}
      ],
      immagini: ["images/dun.jpg", "images/homegif.gif"],
    ),

    // STANZA 2
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
      isCombattimentoPresente: false,
      dialogoStanza: [
        {"stanza1": false},
        {"dialogo2": false},
        {"dialogo3": true}
      ],
      immagini: ["images/dun.jpg", "images/homegif.gif"],
    ),

    // STANZA 3
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
      isCombattimentoPresente: false,
      dialogoStanza: [
        {"stanza1": false},
        {"dialogo2": false},
        {"dialogo3": true}
      ],
      immagini: ["images/dun.jpg", "images/homegif.gif"],
    ),

    // STANZA 4
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
      isCombattimentoPresente: false,
      dialogoStanza: [
        {"stanza1": false},
        {"dialogo2": false},
        {"dialogo3": true}
      ],
      immagini: ["images/dun.jpg", "images/homegif.gif", "images/homegif.gif"],
    ),
  ];
}
