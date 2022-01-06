import 'package:codice/model/oggetto.dart';
import 'package:flutter/cupertino.dart';

class Personaggio with ChangeNotifier {
  Personaggio({required this.nome}) {
    //se voglio che una variabile possa assumere il valore null devo metter ?
    //es: String?
    salute = 100;
  }

  final String nome;
  late int salute;
  List<Oggetto> listaOggetti = [];

  //TODO: fare test sul valore di n, deve essere un valore positivo e non maggiore di un tot
  //test 2 la salute dopo il cambio può avere valore massimo 110
  void incrSalute(int n) => salute += n;

  //test: valor eminimo 1 do l'aggiornamento
  void decrSalute(int n) => salute -= n;

  int getSalute() => salute;
}
