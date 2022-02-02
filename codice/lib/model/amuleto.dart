import 'package:codice/model/partita_stats.dart';
import 'package:get_it/get_it.dart';
import 'package:codice/utils/facade.dart';

class Amuleto extends Oggetto {
  Amuleto({required String name, required bool isMalefico, required int effetto})
      : super(
          name: name,
          effetto: effetto,
          isMalefico: isMalefico,
          icon: "images/amuletoIcon.png",
        );

  @override
  void usa(Personaggio personaggio, Oggetto oggetto, Stanza stanza) {
    if (!oggetto.isMalefico) {
      personaggio.incrSalute(oggetto.effetto!);
    } else {
      personaggio.decrSalute(oggetto.effetto!);
    }
    GetIt.instance<PartitaStats>().aumentaOggettiUtilizzati();
    personaggio.eliminaOggetto(oggetto);
  }
}
