abstract class Oggetto {
  static late int id = 0;

  Oggetto() {
    id = id++;
  }

  int getId() {
    return id;
  }

  void usa() {}
}
