import 'package:codice/model/partita.dart';
import 'package:uuid/uuid.dart';

abstract class Oggetto {
  var id = const Uuid().v1();
  late String icon;
  final String name;
  final bool isMalefico;
  final int? effetto;
  final TipoOggetto tipoOggetto;

  Oggetto(
      {required this.name,
      this.isMalefico = false,
      this.effetto,
      required this.tipoOggetto,
      required this.icon});

  getId() => id;

  int? getEffetto() {
    return effetto;
  }
}

enum TipoOggetto { SPADA, SCUDO, AMULETO, ARCO }
