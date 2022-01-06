import 'package:codice/model/nemico.dart';
import 'domanda.dart';

// Questa modello contiene le informaioni sul combattimento.
// Quando una stanza viene creata gli vengono associati dei combattimenti. Ogni combattimento include un nemico e delle domande
// Il numero di domande e la loro difficoltà dipende dall'index della stanza

class Combattimento {
  final Nemico nemico;
  final List<Domanda> domande;

  Combattimento({required this.nemico, required this.domande});
}
