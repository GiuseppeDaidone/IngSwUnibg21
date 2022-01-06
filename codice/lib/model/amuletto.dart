import 'package:codice/model/oggetto.dart';

abstract class Amuletto extends Oggetto {
  late String incantesimo;

  Amuletto({required incantesimo}) : super();

  // TODO: ovverride implementando la logica e il funzionamento del amuletto specifico
  void avviaIncantesimo() {}
}
