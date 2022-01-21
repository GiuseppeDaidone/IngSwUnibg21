import 'package:codice/model/oggetto.dart';

class Amuleto extends Oggetto {
  Amuleto(
      {required String name, required bool isMalefico, required int effetto})
      : super(
          name: name,
          effetto: effetto,
          isMalefico: isMalefico,
          icon: "images/amuletoIcon.png",
        );
}
