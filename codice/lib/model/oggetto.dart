abstract class Oggetto {
  static int id = 0;

  Oggetto() {
    id = id++;
  }

  int getId() => id;

  void usa() {}
}
