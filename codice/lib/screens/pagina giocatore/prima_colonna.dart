import 'package:codice/screens/pagina%20giocatore/widgets%20pagina%20giocatore/pulsante_inventario.dart';
import 'package:codice/screens/pagina%20giocatore/widgets%20pagina%20giocatore/pulsante_menu.dart';
import 'package:codice/screens/pagina_home.dart';
import 'package:flutter/material.dart';

// CONTENUTO PRIMA COLONNA
//
// Pulsante Menu, Overlay Info Giocatore, Pulsante Inventario

class PrimaColonna extends StatelessWidget {
  const PrimaColonna({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // PULSANTE MENU
        const PulsanteMenu(),

        // OVERLAY INFO GIOCATORE
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Nome Giocatore"),
              Text("HP 50"),
            ],
          ),
        ),

        // PULSANTE INVENTARIO
        const PulsanteInventario()
      ],
    );
  }
}
