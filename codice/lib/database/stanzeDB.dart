import 'dart:math';

import 'package:codice/model/azione.dart';
import 'package:codice/model/personaggio.dart';
import 'package:codice/model/stanza.dart';

// Questa classe simula la presente di un database dove sono contenuti tutti i modelli delle classi disponibili del gioco
// NB: per le stanze che hanno un combattimento, azioniDisponibili[] e dialogoStanza[] devono essere vuoti!!
// NB: "p" ed "s" sono le nostre istanze future di Personaggio e della stanza corrente in cui si trova

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
        // AZIONE 1
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            p!.addOggetto(s!.oggettoStanza);
            return;
          },
          titoloPulsante: "Raccogli l'oggetto",
        ),

        // AZIONE 2
        Azione(
            f1: ({Stanza? s, Personaggio? p}) {
              print("azione2");
              return;
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
            f1: ({Stanza? s, Personaggio? p}) {
              print("azione1");
              return;
            },
            titoloPulsante: "Azione1"),
        Azione(
            f1: ({Stanza? s, Personaggio? p}) {
              print("azione1");
              return;
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
      immagini: ["images/dun.jpg", "images/m.gif"],
    ),
  ];
}
