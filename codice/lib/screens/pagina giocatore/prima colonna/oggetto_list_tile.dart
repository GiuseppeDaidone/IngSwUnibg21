import 'dart:math';

import 'package:codice/model/amuleto.dart';
import 'package:codice/model/oggetto.dart';
import 'package:codice/model/personaggio.dart';
import 'package:codice/model/scudo.dart';
import 'package:codice/model/spada.dart';
import 'package:codice/theme/game_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OggettoListTile extends StatelessWidget {
  OggettoListTile({Key? key, required this.oggetto, required this.personaggio})
      : super(key: key);

  final Oggetto oggetto;
  Personaggio personaggio;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Gestisco logica per quando un item viene cliccato
      onTap: () {
        print(oggetto.getId());
        // AMULETO
        if (oggetto is Amuleto) {
          if (!oggetto.isMalefico) {
            personaggio.incrSalute(oggetto.getEffetto()!);
          } else {
            personaggio.decrSalute(oggetto.getEffetto()!, context);
          }

          personaggio.eliminaOggetto(oggetto);
          Navigator.pop(context);
        }

        // SPADA
        else if (oggetto is Spada) {
          if (personaggio.oggettoEquipaggiato != null &&
              personaggio.oggettoEquipaggiato!.getId() == oggetto.getId()) {
            personaggio.disequipaggiaOggetto();
            print("sos");
          } else {
            personaggio.equipaggiaOggetto(oggetto);
          }
        }

        // SCUDO
        else if (oggetto is Scudo) {
          if (personaggio.oggettoEquipaggiato != null &&
              personaggio.oggettoEquipaggiato!.getId() == oggetto.getId()) {
            personaggio.disequipaggiaOggetto();
          } else {
            personaggio.equipaggiaOggetto(oggetto);
          }
        }

        // ARCO
        else {
          if (personaggio.oggettoEquipaggiato != null &&
              personaggio.oggettoEquipaggiato!.getId() == oggetto.getId()) {
            personaggio.disequipaggiaOggetto();
          } else {
            personaggio.equipaggiaOggetto(oggetto);
          }
        }
      },

      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: GameTheme.buttonColor,
          ),
          child: Center(
            child: Row(
              children: [
                // ICONA OGGETTO
                ImageIcon(
                  AssetImage(oggetto.icon),
                  size: 20,
                ),

                SizedBox(width: 30),

                // NOME OGGETTO
                Text(oggetto.name)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
