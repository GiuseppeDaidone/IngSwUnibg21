import 'package:codice/model/oggetto.dart';
import 'package:codice/model/personaggio.dart';
import 'package:codice/model/stanza.dart';

class Spada extends Oggetto {
  Spada({required String name})
      : super(
          name: name,
          icon: "images/spadaIcon.png",
        );

  @override
  void usa(Personaggio personaggio, Oggetto oggetto, Stanza stanza) {
    if (personaggio.oggettoEquipaggiato != null && personaggio.oggettoEquipaggiato!.id == oggetto.id) {
      personaggio.disequipaggiaOggetto();
    } else {
      personaggio.equipaggiaOggetto(oggetto);
    }
  }
}
