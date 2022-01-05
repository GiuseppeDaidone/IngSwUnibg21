import 'package:codice/screens/pagina%20giocatore/prima_colonna.dart';
import 'package:flutter/material.dart';

// STRUTTURA PAGINA
//
// La pagina è organizzata in 3 colonne. PrimaColonna, SecondaColonna, TerzaColonna

class PaginaGiocatore extends StatefulWidget {
  const PaginaGiocatore({Key? key}) : super(key: key);

  @override
  _PaginaGiocatoreState createState() => _PaginaGiocatoreState();
}

class _PaginaGiocatoreState extends State<PaginaGiocatore> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            PrimaColonna(),
          ],
        ),
      ),
    );
  }
}
