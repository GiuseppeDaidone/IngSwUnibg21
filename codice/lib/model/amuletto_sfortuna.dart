import 'package:codice/model/amuletto.dart';

class AmulettoSfortuna extends Amuletto {
  AmulettoSfortuna({required incantesimo}) : super(incantesimo: incantesimo);

  @override
  void avviaIncantesimo() {
    //implementare la logica del beccare domande difficili e non trovare nessun oggetto nella prossima stanza
    //oppure che l'oggetto che troverò nella prossima stanza è quella della vita
  }
}
