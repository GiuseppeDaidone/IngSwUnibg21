import 'package:codice/model/oggetto.dart';
import 'package:codice/screens/pagina%20finale/pagina_finale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Personaggio with ChangeNotifier {
  Personaggio({required this.nome}) {
    salute = 100;
  }

  Oggetto? oggettoEquipaggiato;
  final String nome;
  late int salute;
  List<Oggetto> listaOggetti = [];

  void incrSalute(int n) {
    salute += n;
    if (salute > 100) {
      salute = 100;
    }
    notifyListeners();
  }

  void decrSalute(int n, context) {
    salute -= n;
    if (salute <= 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const PaginaFinale(
              isDead: true,
            );
          },
        ),
      );
    }
    notifyListeners();
  }

  void addOggetto(Oggetto o) {
    listaOggetti.add(o);
  }

  void equipaggiaOggetto(oggetto) {
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

  int getSalute() => salute;
}
