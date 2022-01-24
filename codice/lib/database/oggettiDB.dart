import 'dart:math';
import 'package:codice/model/amuleto.dart';
import 'package:codice/model/arco.dart';
import 'package:codice/model/oggetto.dart';
import 'package:codice/model/scudo.dart';
import 'package:codice/model/spada.dart';

class OggettiDB {
  // Lista di tutti gli oggetti Disponibili
  List<Oggetto> listaOggetti = [
    Arco(
      name: "Arco di quercia",
    ),
    Spada(name: "Spada di Theoden"),
    Scudo(name: "Scudo di rame"),
    Arco(
      name: "Arco Lungo Elfico",
    ),
    Spada(name: "Spadone di Titanio"),
    Scudo(name: "Scudo di Rohan"),
    Arco(
      name: "Arco di Lothorien",
    ),
    Spada(name: "Spada di Isildur"),
    Scudo(name: "Scudo Della Contea"),
    Amuleto(name: "Pietra Argentea", isMalefico: true, effetto: 10),
    Amuleto(name: "Collana Corrotta", isMalefico: true, effetto: 20),
    Amuleto(name: "Anello Fatato", isMalefico: false, effetto: 8),
    Amuleto(name: "Letroll", isMalefico: true, effetto: 99),
    Amuleto(name: "Renooo Jackos", isMalefico: false, effetto: 100),
    Amuleto(name: "Gemma Dell'acqua", isMalefico: false, effetto: 20),
    Amuleto(name: "Medaglione di Corvo Nero", isMalefico: true, effetto: 30),
    Amuleto(name: "Pietra Filosofale", isMalefico: false, effetto: 50),
  ];

  // Recupero un oggetto a caso da quelli disponibili
  Oggetto getOggetto() {
    return listaOggetti[Random().nextInt(listaOggetti.length)];
  }
}
