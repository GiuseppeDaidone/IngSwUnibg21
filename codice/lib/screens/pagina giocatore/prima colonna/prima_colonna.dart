import 'package:codice/model/personaggio.dart';
import 'package:codice/screens/pagina%20giocatore/prima%20colonna/pulsante_inventario.dart';
import 'package:codice/screens/pagina%20giocatore/prima%20colonna/pulsante_menu.dart';
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
            child: Consumer<Personaggio>(
              builder: (context, personaggio, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Nome personaggio
                  Text(
                    personaggio.nome,
                    style: const TextStyle(fontSize: 25),
                  ),

                  // Salute Attuale
                  Text(
                    "HP: " + personaggio.salute.toString(),
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),

          // ITEM EQUIPAGGIATO
          Provider.of<Personaggio>(context).oggettoEquipaggiato != null
              ? ImageIcon(
                  AssetImage(
                    Provider.of<Personaggio>(context).oggettoEquipaggiato!.icon,
                  ),
                )
              : const SizedBox(),
          const Spacer(),

          // PULSANTE INVENTARIO
          Container(
            margin: const EdgeInsets.all(30),
            child: const PulsanteInventario(),
          )
        ],
      ),
    );
  }
}
