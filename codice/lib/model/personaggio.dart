import 'package:codice/model/oggetto.dart';
import 'package:codice/model/partita.dart';
import 'package:codice/screens/pagina%20finale/pagina_finale.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  void decrSalute(int n, trueContext) {
    salute -= n;
    if (salute <= 0) {
      Navigator.push(
        trueContext,
        MaterialPageRoute(
          builder: (context) {
            return ChangeNotifierProvider<Partita>(
              create: (_) => Provider.of<Partita>(trueContext),
              builder: (context, partita) {
                return const PaginaFinale(
                  isDead: true,
                );
              },
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
