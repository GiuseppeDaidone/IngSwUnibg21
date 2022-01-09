import 'package:codice/model/nemico.dart';
import 'domanda.dart';

// Questa modello contiene le informaioni sul combattimento.
// Quando una stanza viene creata gli vengono associati dei combattimenti. Ogni combattimento include un nemico e delle domande
// Il numero di domande e la loro difficoltà dipende dall'index della stanza

class Combattimento {
  final Nemico nemico;
  final List<Domanda> domande;
  int indexDomandaCorrente = 0;
  // Se bool = true allora la string è una domanda, quindi recupero in base all'index domanda le risposte disponibili da mostrare
  final List<Map<String, bool>> dialogoCombattimento;

  Combattimento(
      {required this.nemico,
      required this.domande,
      required this.dialogoCombattimento});

  void nextDomanda() {
    indexDomandaCorrente++;
  }

  void resetIndexDomanda() {
    indexDomandaCorrente = 0;
  }
}
