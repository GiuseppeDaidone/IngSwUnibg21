import 'package:codice/model/personaggio.dart';
import 'package:codice/screens/pagina%20finale/pagina_finale.dart';
import 'package:codice/screens/pagina%20giocatore/prima%20colonna/prima_colonna.dart';
import 'package:codice/screens/pagina%20giocatore/seconda%20colonna/seconda_colonna.dart';
import 'package:codice/screens/pagina%20giocatore/terza%20colonna/terza_colonna.dart';
import 'package:codice/theme/game_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return WillPopScope(
      onWillPop: () async => false,
      child: Consumer<Personaggio>(
        builder: (context, personaggio, _) {
          return personaggio.getSalute() <= 0
              ? const PaginaFinale(isDead: true)
              : Scaffold(
                  backgroundColor: GameTheme.secondaryColor,
                  body: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Expanded(
                        child: PrimaColonna(),
                      ),
                      Expanded(
                        flex: 3,
                        child: SecondaColonna(),
                      ),
                      Expanded(
                        child: TerzaColonna(),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
