import 'package:codice/model/amuleto.dart';

class AmuletoMorte extends Amuleto {
  AmuletoMorte({required incantesimo}) : super(incantesimo: incantesimo);

  @override
  void avviaIncantesimo() {
    //se la trovo sfortunatamente mi riduce di 10 la vita
  }
}
