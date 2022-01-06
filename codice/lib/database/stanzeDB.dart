import 'package:codice/model/stanza.dart';

// Questa classe simula la presente di un database dove sono contenuti tutti i modelli delle classi disponibili del gioco

class StanzeDB {
  // Lista di stanze iniziali
  List<Stanza> stanzeIniziali = [];

  // Lista di stanze in cui è presente un combattimento
  List<Stanza> stanzeCombattimento = [];

  // Lista di stanze in cui si può solo esplorare
  List<Stanza> stanzeEsplorazione = [];
}
