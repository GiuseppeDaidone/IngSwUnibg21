import 'package:codice/model/personaggio.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

abstract class Oggetto {
  String id = const Uuid().v1();
  late String icon;
  final String name;
  final bool isMalefico;
  final int? effetto;

  Oggetto(
      {required this.name,
      this.isMalefico = false,
      this.effetto,
      required this.icon});

  void usa(Personaggio p, Oggetto o, BuildContext context) {}
}

enum TipoOggetto { SPADA, SCUDO, AMULETO, ARCO }
