import 'package:codice/screens/pagina%20finale/box_statistiche.dart';
import 'package:codice/screens/pagina%20home/pagina_home.dart';
import 'package:codice/screens/pagina%20inserimento%20nome/pagina_inserimento_nome.dart';
import 'package:codice/theme/game_fonts.dart';
import 'package:codice/theme/game_theme.dart';
import 'package:flutter/material.dart';

// PAGINA FINALE [PAG4]

class PaginaFinale extends StatelessWidget {
  const PaginaFinale({Key? key, required this.isDead}) : super(key: key);

  final bool isDead;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Column(
        children: <Widget>[
          const Expanded(
            child: SizedBox(),
          ),

          // TITOLO
          isDead
              ? Expanded(
                  child: Text(
                    "GAME OVER",
                    style: GameFonts().hallelujaFont(size: 50),
                  ),
                )
              : Expanded(
                  child: Text(
                    "Congratulazioni Per Aver Completato Il Gioco",
                    style: GameFonts().hallelujaFont(size: 50),
                  ),
                ),

          // BOX STATISTICHE
          BoxStatistiche(),

          // PULSANTI A FONDO PAGINA
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                // PULSANTE TORNA ALLA HOME
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: GameTheme.buttonColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PaginaHome();
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    height: size.height / 13,
                    width: size.width / 7,
                    child: Center(
                      child: Text(
                        "Torna alla home",
                        style: GameFonts().hallelujaFont(size: 20),
                      ),
                    ),
                  ),
                ),

                // PULSANTE GIOCA ANCORA
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: GameTheme.buttonColor,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PaginaInserimentoNome();
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    height: size.height / 13,
                    width: size.width / 7,
                    child: Center(
                      child: Text(
                        "Gioca Ancora",
                        style: GameFonts().hallelujaFont(size: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
