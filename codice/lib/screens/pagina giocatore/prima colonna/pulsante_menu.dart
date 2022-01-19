import 'package:codice/theme/game_fonts.dart';
import 'package:codice/theme/game_theme.dart';
import 'package:flutter/material.dart';
import '../../pagina home/pagina_home.dart';

class PulsanteMenu extends StatelessWidget {
  const PulsanteMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      child: Text(
        "Menù",
        style: GameFonts().hallelujaFont(size: 20),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 5,
        primary: GameTheme.buttonColor,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: GameTheme.primaryColor,
              actions: [
                // Pulsante Continua Partita
                Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: GameTheme.buttonColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: size.height / 5,
                  width: size.width / 5,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Continua la partita",
                      style: GameFonts().hallelujaFont(size: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                // Pulsante Torna al menu principale
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: GameTheme.buttonColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: size.height / 5,
                  width: size.width / 5,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return const PaginaHome();
                          }),
                        ),
                      );
                    },
                    child: Text(
                      "Torna al menù principale",
                      style: GameFonts().hallelujaFont(size: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
