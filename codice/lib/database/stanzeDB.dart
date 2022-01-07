import 'package:codice/model/stanza.dart';

// Questa classe simula la presente di un database dove sono contenuti tutti i modelli delle classi disponibili del gioco

class StanzeDB {
  // Lista di stanze iniziali
  List<Stanza> stanzeIniziali = [];
  Stanza getStanzaIniziale() {
    //TODO: Ritorno una stanza casuale tra quelle iniziali
    return stanzeIniziali[0];
  }

  // Lista di stanze in cui è presente un combattimento
  List<Stanza> stanzeCombattimento = [];
  Stanza getStanzaCombattimento() {
    //TODO: Ritorno una stanza casuale tra quelle combattimento
    return stanzeCombattimento[0];
  }

  // Lista di stanze in cui si può solo esplorare
  List<Stanza> stanzeEsplorazione = [];
  Stanza getStanzaEsplorazione() {
    //TODO: Ritorno una stanza casuale tra quelle esplorazione
    return stanzeEsplorazione[0];
  }
}
