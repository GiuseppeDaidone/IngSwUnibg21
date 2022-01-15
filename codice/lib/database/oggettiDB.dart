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
    Spada(name: "Spada lunga"),
    Scudo(name: "Scudo di rame"),
    Amuleto(name: "Pietra Argentea", isMalefico: true, effetto: 10),
    Amuleto(name: "Collana Corrotta", isMalefico: true, effetto: 20),
    Amuleto(name: "Anello Fatato", isMalefico: false, effetto: 8),
    Amuleto(name: "Letroll", isMalefico: true, effetto: 99),
    Amuleto(name: "Renooo Jackos", isMalefico: false, effetto: 100),
  ];

  // Recupero un oggetto a caso da quelli disponibili
  Oggetto getOggetto() {
    return listaOggetti[Random().nextInt(listaOggetti.length)];
  }
}
