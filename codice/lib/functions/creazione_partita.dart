import 'dart:math';

import 'package:codice/database/domandeDB.dart';
import 'package:codice/database/esplorazioneDB.dart';
import 'package:codice/database/nemicoDB.dart';
import 'package:codice/model/domanda.dart';
import 'package:codice/model/esplorazione.dart';
import 'package:codice/model/nemico.dart';
import 'package:codice/model/stanza.dart';
import 'package:codice/model/stanza_combattimento.dart';
import 'package:codice/model/stanza_esplorazione.dart';

class CreazionePartita {
  // Genero la mappa pescando in modo random le stanze dal database: stanzeDB
  List<Stanza> creaMappa() {
    List<Stanza> mappa = [];

    for (int i = 0; i < 4; i++) {
      // Mappa Iniziale
      if (i == 0) {
        mappa.add(StanzaEsplorazione());
        mappa.last.setIndex(i);
      }

      // Mappe Combattimento
      else if (i % 3 == 0) {
        mappa.add(StanzaCombattimento());
        mappa.last.setIndex(i);
      }

      // Mappa Esplorazione
      else {
        mappa.add(StanzaEsplorazione());
        mappa.last.setIndex(i);
      }
    }
    return mappa;
  }

  // Funzione che associa le domande ai nemici creati
  // TODO: scrivere funzione che pesca le domande in base a livello e disciplina
  List<Domanda> creaDomandeNemico(
      LivelloNemico livello, Disciplina disciplina) {
    List<Domanda> listaDomande = DomandeDB().listaDomande;
    List<Domanda> listaDomandeRitornate = [];

    for (int i = 0; i < 3; i++) {
      if (livello == LivelloNemico.BASSO) {
        listaDomandeRitornate.addAll(listaDomande
            .where(
              (element) =>
                  disciplina == element.disciplina &&
                  element.difficolta == Difficolta.FACILE,
            )
            .toList());
      } else if (livello == LivelloNemico.MEDIO) {
        listaDomandeRitornate.addAll(listaDomande
            .where(
              (element) =>
                  disciplina == element.disciplina &&
                  element.difficolta == Difficolta.MEDIO,
            )
            .toList());
      } else {
        listaDomandeRitornate.addAll(listaDomande
            .where(
              (element) =>
                  disciplina == element.disciplina &&
                  element.difficolta == Difficolta.DIFFICILE,
            )
            .toList());
      }
    }

    return listaDomandeRitornate;
  }

  // Quando una in cui è presente un combattimento viene creata, il costruttore chiama questa funzione genere il combattimento
  Nemico creaNemico(int indexStanza) {
    // In base all'index della stanza, verrà creato un combattimento più o meno difficile. Si andrà quindi a controllare l'index
    // ed in base a quello si decide da quale lista domande pescare, quante pescarne e quale nemico associare al combattimento

    // I dialoghi rimarranno sempre gli stessi per gli stessi nemici, ma le domande saranno prese a caso dal database
    if (indexStanza >= 0 && indexStanza <= 3) {
      return NemicoDB()
          .listaNemici[Random().nextInt(NemicoDB().listaNemici.length)];
    } else if (indexStanza >= 4 && indexStanza <= 6) {
      return NemicoDB()
          .listaNemici[Random().nextInt(NemicoDB().listaNemici.length)];
    } else {
      return NemicoDB()
          .listaNemici[Random().nextInt(NemicoDB().listaNemici.length)];
    }
  }

  Esplorazione creaEsplorazione() {
    return EsplorazioneDB().getEsplorazione();
  }
}
