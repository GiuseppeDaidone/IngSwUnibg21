import 'package:codice/model/oggetto.dart';
import 'package:flutter/cupertino.dart';

class Personaggio with ChangeNotifier {
  Personaggio({required this.nome}) {
    salute = 100;
  }

  final String nome;
  late int salute;
  List<Oggetto> listaOggetti = [];

  void incrSalute(int n) {
    salute += n;
    notifyListeners();
  }

  void decrSalute(int n) {
    salute -= n;
    notifyListeners();
  }

  void addOggetto(Oggetto o) {
    listaOggetti.add(o);
  }

  int getSalute() => salute;
}
