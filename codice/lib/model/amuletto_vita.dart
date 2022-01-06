import 'package:codice/model/amuletto.dart';

class AmulettoVita extends Amuletto {
  AmulettoVita({required incantesimo}) : super(incantesimo: incantesimo);

  @override
  void avviaIncantesimo() {
    //implementare la logica del aggiungere 10 vita al personaggio
  }
}
