import 'dart:html';

import 'package:codice/model/amuletto.dart';
import 'package:codice/model/amuletto.dart';

class AmulettoMorte extends Amuletto {
  AmulettoMorte({required incantesimo}) : super(incantesimo: incantesimo);

  @override
  void avviaIncantesimo() {
    //se la trovo sfortunatamente mi riduce di 10 la vita
  }
}
