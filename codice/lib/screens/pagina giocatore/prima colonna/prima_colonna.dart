import 'package:codice/model/Personaggio.dart';
import 'package:codice/screens/pagina%20giocatore/widgets%20pagina%20giocatore/pulsante_inventario.dart';
import 'package:codice/screens/pagina%20giocatore/widgets%20pagina%20giocatore/pulsante_menu.dart';
import 'package:codice/theme/game_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// CONTENUTO PRIMA COLONNA
//
// Pulsante Menu, Overlay Info Giocatore, Pulsante Inventario

class PrimaColonna extends StatelessWidget {
  const PrimaColonna({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: GameTheme.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // PULSANTE MENU
          Container(
            margin: const EdgeInsets.all(25),
            child: const PulsanteMenu(),
          ),

          // OVERLAY INFO GIOCATORE
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: GameTheme.secondaryColor,
              ),
            ),
            margin: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                // Nome personaggio
                Text(
                  "ZuppaSAlata97",
                  //personaggio.nome,
                  style: const TextStyle(fontSize: 25),
                ),

                // Salute Attuale
                Text(
                  "HP 100",
                  // "HP: " + personaggio.salute.toString(),
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),

            /*  Consumer<Personaggio>(
              builder: (context, personaggio, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Nome personaggio
                  Text(
                    "273",
                    //personaggio.nome,
                    style: const TextStyle(fontSize: 25),
                  ),

                  // Salute Attuale
                  Text(
                    "jkdjs1",
                    // "HP: " + personaggio.salute.toString(),
                    style: const TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
 */
          ),

          const Spacer(),

          // PULSANTE INVENTARIO
          Container(
            margin: const EdgeInsets.all(50),
            child: const PulsanteInventario(),
          )
        ],
      ),
    );
  }
}
