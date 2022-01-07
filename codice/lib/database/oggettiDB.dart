import 'dart:math';

import 'package:codice/model/amuleto.dart';
import 'package:codice/model/amuleto_fortuna.dart';
import 'package:codice/model/amuleto_morte.dart';
import 'package:codice/model/amuleto_sfortuna.dart';
import 'package:codice/model/amuleto_vita.dart';
import 'package:codice/model/arco.dart';
import 'package:codice/model/oggetto.dart';
import 'package:codice/model/scudo.dart';
import 'package:codice/model/spada.dart';

class OggettiDB {
  // Lista di tutti gli oggetti Disponibili
  List<Oggetto> listaOggetti = [
    Arco(),
    Spada(),
    Scudo(),
    AmuletoFortuna(incantesimo: 10),
    AmuletoMorte(incantesimo: 10),
    AmuletoSfortuna(incantesimo: 10),
    AmuletoVita(incantesimo: 10),
  ];

  // Recupero un oggetto a caso da quelli disponibili
  Oggetto getOggetto() {
    return listaOggetti[Random().nextInt(listaOggetti.length)];
  }
}
