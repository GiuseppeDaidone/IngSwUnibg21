import 'package:codice/theme/game_theme.dart';
import 'package:flutter/material.dart';

import '../../pagina home/pagina_home.dart';

class PulsanteMenu extends StatelessWidget {
  const PulsanteMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Menù"),
      style: ElevatedButton.styleFrom(
        elevation: 5,
        primary: GameTheme.secondaryColor,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              actions: [
                // Pulsante Continua Partita
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Continua la partita"),
                ),

                // Pulsante Torna al menu principale
                TextButton(
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
                  child: const Text("Torna al menù principale"),
                )
              ],
            );
          },
        );
      },
    );
  }
}
