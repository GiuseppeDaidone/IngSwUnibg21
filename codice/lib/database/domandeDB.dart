import 'package:codice/model/domanda.dart';

class DomandeDB {
  List<Domanda> listaDomande = [
    Domanda(
      Difficolta.FACILE,
      "Rosso",
      testoDomanda: "Di che colore è il cavallo bianco di napoleone?",
      risposte: ["Bianco", "Rosso", "Blu", "Verde"],
    ),
    Domanda(
      Difficolta.FACILE,
      "4",
      testoDomanda: "Quanto fa 1+3?",
      risposte: ["3", "6", "1", "4"],
    ),
  ];
}
