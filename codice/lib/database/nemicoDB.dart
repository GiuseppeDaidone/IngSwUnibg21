import 'package:codice/model/boss.dart';
import 'package:codice/model/nemico.dart';

class NemicoDB {
  List<Nemico> listaNemici = [
    // NEMICO 1
    Boss(
      immagineSfondo: "images/nemico1sfondo.jpg",
      disciplina: Disciplina.RETI,
      // Immagini del nemico che cambiano in base all'azione svolta
      // Ogni nemico deve avere sempre 5 immagini poste nella lista sempre con lo stesso ordine
      // index: 0 -> nemico parla, 1 -> nemico racconta domanda, 2 -> nemico ride, 3 -> nemico piange, 4-> nemico sconfitto
      immaginiNemico: [
        "images/minotaur_idleblink.gif",
        "images/minotaur_attacking.gif",
        "images/minotaur_taunt.gif",
        "images/minotaur_hurt.gif",
        "images/minotaur_dying.gif",
      ],
      livello: LivelloNemico.BASSO,
      dialogoCombattimento: [
        {"Ciao viaggiatore, cosa ci fai in questo posto? Ti Sei perso?": false},
        {
          "Ti darò il mio aiuto, ma solo se saprai rispondere alle prossime domande":
              false
        },
        {"Se non saprai rispodere sarò costretto a DISTRUGGERTI!": false},
        {"ok, iniziamo, prima domanda": false},
        {"testo domanda": true},
        {"ah ma allora ne sai qualcosa di reti!": false},
        {"In ogni caso non basta, ecco un'altra domanda": false},
        {"testo domanda 2": true},
        {
          "mmm, qui si fa  sul serio, è ora di sfoderare la mia domanda migliore":
              false
        },
        {"": true},
        {
          "Bravo viaggiatore, non ci sono molte persone brave come te, ti aiuterò a raggiungere la prossima stanza":
              false
        },
      ],
      nome: "Ragnor",
    ),

    /* // NEMICO 2
    Boss(
      immagineSfondo: "images/nemico2sfondo.jpg",
      disciplina: Disciplina.DATABASE,
      immaginiNemico: [],
      livello: LivelloNemico.MEDIO,
      dialogoCombattimento: [
        {"": false},
        {"": false},
        {"": false},
        {"": false},
        {"": true},
        {"": false},
        {"": false},
        {"": true},
        {"": false},
        {"": true},
        {"": false},
      ],
      nome: "Giorgio",
    ),

    // NEMICO 3
    Boss(
      immagineSfondo: "images/nemico3sfondo.jpg",
      disciplina: Disciplina.INGSW,
      immaginiNemico: [],
      livello: LivelloNemico.ALTO,
      dialogoCombattimento: [
        {"": false},
        {"": false},
        {"": false},
        {"": false},
        {"": true},
        {"": false},
        {"": false},
        {"": true},
        {"": false},
        {"": true},
        {"": false},
      ],
      nome: "Giorgio",
    ) */
  ];
}
