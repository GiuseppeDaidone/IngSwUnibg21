import 'package:codice/model/oggetto.dart';

abstract class Amuleto extends Oggetto {
  late String incantesimo;

  Amuleto({required incantesimo}) : super();

  // TODO: ovverride implementando la logica e il funzionamento del amuletto specifico
  void avviaIncantesimo() {}
}
