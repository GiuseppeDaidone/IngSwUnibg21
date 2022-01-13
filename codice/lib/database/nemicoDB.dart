import 'package:codice/model/nemico.dart';

class NemicoDB {
  List<Nemico> listaNemici = [
    // NEMICO 1
    Nemico(
      disciplina: Disciplina.MATEMATICA,
      // Immagini del nemico che cambiano ad ogni domanda che si risponde
      immagine: ["images/m.gif", "images/ca.gif"],
      livello: LivelloNemico.MEDIO,
      dialogoCombattimento: [
        {"Hey Come va": false},
        {"Sei pronto alla domanda?": false},
        {"testo domanda": true},
        {"ed ora?": false},
        {"ecco un altra domanda": true},
        {"bravo 30": false}
      ],
      // Prendo domande dal database !! stare attenti che ci sia coerenza con il numero di domande indicato nel dialogoCombattimento!!
      nome: "Giorgio",
    )
  ];
}
