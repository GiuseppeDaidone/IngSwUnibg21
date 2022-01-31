import 'package:codice/model/boss.dart';
import 'package:codice/model/nemico.dart';
import 'package:codice/model/scagnozzo.dart';

class NemicoDB {
  List<Nemico> listaNemici = [
    // NEMICO 1
    Scagnozzo(
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
        /*   {
          "Bravo viaggiatore, non ci sono molte persone brave come te, ti aiuterò a raggiungere la prossima stanza":
              false
        }, */
      ],
      nome: "Ragnor",
    ),

    // NEMICO 2
    Scagnozzo(
      immagineSfondo: "images/nemico2sfondo.jpg",
      disciplina: Disciplina.DATABASE,
      immaginiNemico: [
        "images/satyr_idleblink.gif",
        "images/satyr_attacking.gif",
        "images/satyr_taunt.gif",
        "images/satyr_hurt.gif",
        "images/satyr_dying.gif",
      ],
      livello: LivelloNemico.MEDIO,
      dialogoCombattimento: [
        {"Ehi, chi sei tu?! Che ci fai qui?!": false},
        {
          "Non dovresti stare da queste parti da solo, è un posto pericoloso":
              false
        },
        {
          "Io sono il Saruman il guardiano, custodisco questa stanza e permetto il passaggio solo a chi se lo merita":
              false
        },
        {
          "Se hai intenzione di passare farai bene a ripassare qualche concetto di Database":
              false
        },
        {"Bene, possiamo iniziare con la prima domanda": false},
        {"domanda1": true},
        {
          "bravo viaggiatore, ma non pensare che sia finita, questo era solo l'inizio":
              false
        },
        {"Ora passiamo a qualcosa di più difficile": false},
        {"domanda2": true},
        {
          "Cavolo, non mi sarei aspettato di trovare un viaggiatore così esperto, vediamo se sai anche la prossima":
              false
        },
        {"domanda3": true},
        /*  {
          "Molto Bene! Hai dimostrato di avere delle ottime conoscenze in database, puoi procedere alla prossima stanza!":
              false
        }, */
      ],
      nome: "Saruman",
    ),

    // NEMICO 3
    Boss(
      immagineSfondo: "images/nemico3sfondo.jpg",
      disciplina: Disciplina.INGSW,
      immaginiNemico: [
        "images/golem_idleblink.gif",
        "images/golem_attacking.gif",
        "images/golem_taunt.gif",
        "images/golem_hurt.gif",
        "images/golem_dying.gif",
      ],
      livello: LivelloNemico.ALTO,
      dialogoCombattimento: [
        {"Eh così infine ce l'hai fatta ad arrivare fin qui": false},
        {
          "Ho assistito al tuo percorso nelle altre stanze e so che non sei un viaggiatore qualunque":
              false
        },
        {
          "Il tuo viaggio sta volgendo al termine ma c'è ancora un ultimo ostacolo sul tuo percorso":
              false
        },
        {
          "Io sono Sauron e sono il capo supremo di questo mondo, vedo e conoscono qualsiasi cosa accada in qualsiasi stanza del reame":
              false
        },
        {
          "Se vuoi concludere il tuo viaggio ti servirà tirare fuori tutte le tue conoscenze in Ingegneria del Software, ti serviranno":
              false
        },
        {"Ecco la prima domanda": false},
        {"domanda1": true},
        {
          "Ben fatto, sapevo che non avresti avuto problemi con questa domanda, ora passiamo a qualcosa di più complesso":
              false
        },
        {"domanda2": true},
        {"Ok, è ora di fare sul serio": false},
        {"Questa potrebbe essere la tua ultima domanda": false},
        {"domanda3": true},
        /*  {
          "Notevole! Non sono in molti a raggiungere questa stanza e sono ancora meno le persone in grado di battermi. Il tuo viaggio è finito viaggiatore, forse un giorno ci rivedremo...":
              false
        }, */
      ],
      nome: "Sauron",
    )
  ];
}
