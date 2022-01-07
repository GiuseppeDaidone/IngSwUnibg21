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
      azioniDisponibili: [],
      dialogoStanza: ["stanza 1"],
      immagini: [],
    ),
    Stanza(
      azioniDisponibili: [],
      dialogoStanza: ["stanza 2"],
      immagini: [],
    ),
    Stanza(
      azioniDisponibili: [],
      dialogoStanza: ["stanza 3"],
      immagini: [],
    ),
    Stanza(
      azioniDisponibili: [],
      dialogoStanza: ["stanza 4"],
      immagini: [],
    ),
  ];

  // Lista di stanze in cui si può solo esplorare
  List<Stanza> stanzeEsplorazione = [
    // STANZA 1
    Stanza(
      azioniDisponibili: [
        Azione(
          f1: () => {print("Azione stanza 1")},
        )
      ],
      dialogoStanza: ["stanza esp 1"],
      immagini: [],
    ),

    // STANZA 2
    Stanza(
      azioniDisponibili: [
        Azione(
          f1: () => {print("Azione stanza 2")},
        )
      ],
      dialogoStanza: ["stanza esp 2"],
      immagini: [],
    ),

    // STANZA 3
    Stanza(
      azioniDisponibili: [
        Azione(
          f1: () => {print("Azione stanza 3")},
        )
      ],
      dialogoStanza: ["stanza esp 3"],
      immagini: [],
    ),

    // STANZA 4
    Stanza(
      azioniDisponibili: [
        Azione(
          f1: () => {print("Azione stanza 4")},
        )
      ],
      dialogoStanza: ["stanza esp 4"],
      immagini: [],
    ),
  ];

  // Lista di stanze in cui è presente un combattimento
  List<Stanza> stanzeCombattimento = [
    // STANZA 1
    Stanza(
      azioniDisponibili: [
        Azione(
          f1: () => {print("Azione stanza 1")},
        )
      ],
      isCombattimentoPresente: true,
      dialogoStanza: ["stanza esp 1"],
      immagini: [],
    ),

    // STANZA 2
    Stanza(
      azioniDisponibili: [
        Azione(
          f1: () => {print("Azione stanza 2")},
        )
      ],
      isCombattimentoPresente: true,
      dialogoStanza: ["stanza esp 2"],
      immagini: [],
    ),

    // STANZA 3
    Stanza(
      azioniDisponibili: [
        Azione(
          f1: () => {print("Azione stanza 3")},
        )
      ],
      isCombattimentoPresente: true,
      dialogoStanza: ["stanza esp 3"],
      immagini: [],
    ),

    // STANZA 4
    Stanza(
      azioniDisponibili: [
        Azione(
          f1: () => {print("Azione stanza 4")},
        )
      ],
      isCombattimentoPresente: true,
      dialogoStanza: ["stanza esp 4"],
      immagini: [],
    ),
  ];
}
