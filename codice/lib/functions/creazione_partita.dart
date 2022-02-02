import 'package:codice/utils/facade.dart';

class CreazionePartita {
  // Genero la mappa pescando in modo random le stanze dal database: stanzeDB
  List<Stanza> creaMappa() {
    List<Stanza> mappa = [];
    List<Esplorazione> ed = EsplorazioneDB().listaEsplorazioni;

    for (int i = 0; i < 4; i++) {
      // Mappe Combattimento
      if (i % 3 == 0) {
        mappa.add(StanzaCombattimento());
        Esplorazione es = ed[Random().nextInt(ed.length)];
        ed.remove(es);
        mappa.last.setIndex(i, ed: es);
      }

      // Mappa Esplorazione
      else {
        mappa.add(StanzaEsplorazione());
        Esplorazione es = ed[Random().nextInt(ed.length)];
        ed.remove(es);
        mappa.last.setIndex(i, ed: es);
      }
    }
    return mappa;
  }

  // Funzione che associa le domande ai nemici creati
  List<Domanda> creaDomandeNemico(LivelloNemico livello, Disciplina disciplina) {
    List<Domanda> listaDomande = DomandeDB().listaDomande;
    List<Domanda> listaDomandeSelezionate = [];
    List<Domanda> listaDomandeReturn = [];

    if (livello == LivelloNemico.BASSO) {
      listaDomandeSelezionate.addAll(listaDomande
          .where(
            (element) => disciplina == element.disciplina && element.difficolta == Difficolta.FACILE,
          )
          .toList());
    } else if (livello == LivelloNemico.MEDIO) {
      listaDomandeSelezionate.addAll(listaDomande
          .where(
            (element) => disciplina == element.disciplina && element.difficolta == Difficolta.MEDIO,
          )
          .toList());
    } else {
      listaDomandeSelezionate.addAll(listaDomande
          .where(
            (element) => disciplina == element.disciplina && element.difficolta == Difficolta.DIFFICILE,
          )
          .toList());
    }

    for (int i = 0; i < 3; i++) {
      listaDomandeReturn.add(
        listaDomandeSelezionate[Random().nextInt(listaDomandeSelezionate.length)],
      );
    }

    return listaDomandeReturn;
  }

  Nemico creaNemico(int indexStanza) {
    if (indexStanza >= 0 && indexStanza <= 3) {
      return NemicoDB().listaNemici.where((element) => element.livello == LivelloNemico.BASSO).toList().first;
    } else if (indexStanza >= 4 && indexStanza <= 6) {
      return NemicoDB().listaNemici.where((element) => element.livello == LivelloNemico.MEDIO).toList().first;
    } else {
      return NemicoDB().listaNemici.where((element) => element.livello == LivelloNemico.ALTO).toList().first;
    }
  }
}
