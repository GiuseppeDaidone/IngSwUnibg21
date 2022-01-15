import 'dart:math';

import 'package:codice/model/azione.dart';
import 'package:codice/model/personaggio.dart';
import 'package:codice/model/stanza.dart';
import 'package:codice/model/stanza_combattimento.dart';
import 'package:codice/model/stanza_esplorazione.dart';

// Questa classe simula la presente di un database dove sono contenuti tutti i modelli delle classi disponibili del gioco
// NB: per le stanze che hanno un combattimento, azioniDisponibili[] e dialogoStanza[] devono essere vuoti!!
// NB: "p" ed "s" sono le nostre istanze future di Personaggio e della stanza corrente in cui si trova

class StanzeDB {
  StanzaEsplorazione getStanzaIniziale() {
    // Ritorno una stanza casuale tra quelle iniziali
    return stanzeIniziali[Random().nextInt(stanzeIniziali.length)];
  }

  StanzaEsplorazione getStanzaEsplorazione() {
    return stanzeEsplorazione[Random().nextInt(stanzeEsplorazione.length)];
  }

  StanzaCombattimento getStanzaCombattimento() {
    return stanzeCombattimento[Random().nextInt(stanzeCombattimento.length)];
  }

  // Lista di stanze iniziali
  List<StanzaEsplorazione> stanzeIniziali = [
    StanzaEsplorazione(
      azioniDisponibili: [
        // AZIONE 1
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            print("Azione 1");
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
    ),
  ];

  // Lista di stanze in cui si può solo esplorare (passo come parametro l'azione da svolgere)
  List<StanzaEsplorazione> stanzeEsplorazione = [
    // STANZA 1
    StanzaEsplorazione(
      azioniDisponibili: [
        // AZIONE 1
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            p!.addOggetto(s!.oggetto);
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
    ),
  ];

  // Lista di stanze in cui è presente un combattimento (non devo passare nessun parametro)
  List<StanzaCombattimento> stanzeCombattimento = [
    // STANZA 1
    StanzaCombattimento(),
  ];
}
