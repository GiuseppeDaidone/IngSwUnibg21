import 'package:codice/model/Personaggio.dart';
import 'package:codice/model/partita.dart';
import 'package:codice/screens/pagina%20giocatore/widgets%20pagina%20giocatore/pulsante_inventario.dart';
import 'package:codice/screens/pagina%20giocatore/widgets%20pagina%20giocatore/pulsante_menu.dart';
import 'package:codice/screens/pagina%20home/pagina_home.dart';
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
      color: Colors.green,
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
            color: Colors.red,
            margin: const EdgeInsets.all(25),
            child: Consumer<Personaggio>(
              builder: (context, personaggio, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Nome personaggio
                  Text(
                    personaggio.nome,
                    style: const TextStyle(fontSize: 25),
                  ),

                  // Salute Attuale
                  Text(
                    personaggio.salute.toString(),
                    style: const TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
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
