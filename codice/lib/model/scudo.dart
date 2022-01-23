// ignore_for_file: avoid_renaming_method_parameters

import 'package:codice/model/oggetto.dart';
import 'package:codice/model/personaggio.dart';
import 'package:flutter/cupertino.dart';

class Scudo extends Oggetto {
  Scudo({required String name})
      : super(
          name: name,
          icon: "images/scudoIcon.png",
        );

  @override
  void usa(Personaggio personaggio, Oggetto oggetto, BuildContext context) {
    if (personaggio.oggettoEquipaggiato != null &&
        personaggio.oggettoEquipaggiato!.id == oggetto.id) {
      personaggio.disequipaggiaOggetto();
    } else {
      personaggio.equipaggiaOggetto(oggetto);
    }
  }
}
