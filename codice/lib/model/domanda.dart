import 'package:codice/model/nemico.dart';

class Domanda {
  final String testoDomanda;
  final Difficolta difficolta;
  final String soluzione;
  final List<String> risposte;
  final Disciplina disciplina;

  Domanda(
    this.difficolta,
    this.soluzione, {
    required this.testoDomanda,
    required this.risposte,
    required this.disciplina,
  });
}

enum Difficolta {
  FACILE,
  MEDIO,
  DIFFICILE,
}
