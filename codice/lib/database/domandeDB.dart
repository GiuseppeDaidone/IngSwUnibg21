import 'dart:math';

import 'package:codice/model/domanda.dart';

// Liste da cui vengono pescate le domande
// le risposte vanno da 2 a 4

class DomandeDB {
  Domanda getDomanda() {
    return listaDomande[Random().nextInt(listaDomande.length)];
  }

  List<Domanda> listaDomande = [
    Domanda(
      Difficolta.FACILE,
      "Blu",
      testoDomanda: "Di che colore è il cavallo bianco di napoleone?",
      risposte: ["Bianco", "Blu", "Verde"],
    ),
    Domanda(
      Difficolta.FACILE,
      "4",
      testoDomanda: "Quanto fa 1+3?",
      risposte: ["3", "6", "1", "4"],
    ),
  ];
}
