import 'package:codice/model/oggetto.dart';

class Scudo extends Oggetto {
  Scudo({required String name})
      : super(
            name: name,
            icon: "images/scudoIcon.png",
            tipoOggetto: TipoOggetto.SCUDO);
}
