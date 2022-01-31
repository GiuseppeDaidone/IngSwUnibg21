import 'package:codice/model/oggetto.dart';
import 'package:codice/model/partita.dart';
import 'package:codice/model/personaggio.dart';
import 'package:codice/model/stanza.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Amuleto extends Oggetto {
  Amuleto(
      {required String name, required bool isMalefico, required int effetto})
      : super(
          name: name,
          effetto: effetto,
          isMalefico: isMalefico,
          icon: "images/amuletoIcon.png",
        );

  @override
  void usa(Personaggio personaggio, Oggetto oggetto, BuildContext context,
      Stanza stanza) {
    if (!oggetto.isMalefico) {
      personaggio.incrSalute(oggetto.effetto!);
    } else {
      personaggio.decrSalute(oggetto.effetto!, trueContext: context);
    }

    Provider.of<Partita>(context, listen: false).aumentaOggettiUtilizzati();
    personaggio.eliminaOggetto(oggetto);
    Navigator.pop(context);
  }
}
