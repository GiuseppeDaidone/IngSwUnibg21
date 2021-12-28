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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // PULSANTE MENU
        Container(
          margin: EdgeInsets.all(50),
          child: PulsanteMenu(),
        ),
        // OVERLAY INFO GIOCATORE
        Container(
          color: Colors.red,
          margin: EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Nome Giocatore",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "HP 50",
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),

        Spacer(),

        // PULSANTE INVENTARIO
        Container(
          margin: EdgeInsets.all(50),
          child: PulsanteInventario(),
        )
      ],
    );
  }
}
