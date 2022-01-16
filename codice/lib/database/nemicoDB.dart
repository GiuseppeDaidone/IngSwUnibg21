import 'package:codice/model/boss.dart';
import 'package:codice/model/nemico.dart';

class NemicoDB {
  List<Nemico> listaNemici = [
    // NEMICO 1
    Boss(
      immagineSfondo: "images/dun.jpg",
      disciplina: Disciplina.MATEMATICA,
      // Immagini del nemico che cambiano in base all'azione svolta
      // Ogni nemico deve avere sempre 5 immagini poste nella lista sempre con lo stesso ordine
      // index: 0 -> nemico parla, 1 -> nemico racconta domanda, 2 -> nemico ride, 3 -> nemico piange, 4-> nemico sconfitto
      immaginiNemico: [
        "images/woolo.png",
        "images/ca.gif",
        "images/kekw.png",
        "images/kekwait.jpg",
        "images/woolo.png"
      ],
      livello: LivelloNemico.MEDIO,
      dialogoCombattimento: [
        {"Hey Come va": false},
        {"Sei pronto alla domanda?": false},
        {"testo domanda": true},
        {"ed ora?": false},
        {"testo domanda 2": true},
        {"bravo 30": false}
      ],
      // Prendo domande dal database !! stare attenti che ci sia coerenza con il numero di domande indicato nel dialogoCombattimento!!
      nome: "Giorgio",
    )
  ];
}
