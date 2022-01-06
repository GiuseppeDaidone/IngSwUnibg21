class Domanda {
  final String testoDomanda;
  final Difficolta _difficolta;
  final String _soluzione;
  // 4 risposte per ciascuna domanda
  final List<String> risposte;

  Domanda(this._difficolta, this._soluzione,
      {required this.testoDomanda, required this.risposte});
}

enum Difficolta {
  FACILE,
  MEDIO,
  DIFFICILE,
}
