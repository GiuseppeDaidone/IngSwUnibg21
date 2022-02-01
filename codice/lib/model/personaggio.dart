import 'package:codice/model/oggetto.dart';
import 'package:flutter/material.dart';

class Personaggio with ChangeNotifier {
  Personaggio({required this.nome}) {
    _salute = 100;
  }

  Oggetto? oggettoEquipaggiato;
  final String nome;
  late int _salute;
  List<Oggetto> listaOggetti = [];

  void incrSalute(int n) {
    _salute += n;
    if (_salute > 100) {
      _salute = 100;
    }
    notifyListeners();
  }

  void decrSalute(int n) {
    _salute -= n;
    notifyListeners();
  }

  int getSalute() => _salute;

  void addOggetto(Oggetto o) {
    listaOggetti.add(o);
  }

  void equipaggiaOggetto(Oggetto? oggetto) {
    oggettoEquipaggiato = oggetto;
    notifyListeners();
  }

  void disequipaggiaOggetto() {
    oggettoEquipaggiato = null;
    notifyListeners();
  }

  void eliminaOggetto(oggetto) {
    listaOggetti.remove(oggetto);
    notifyListeners();
  }
}
