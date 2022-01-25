import 'package:codice/model/amuleto.dart';
import 'package:codice/model/oggetto.dart';
import 'package:codice/model/partita.dart';
import 'package:codice/model/personaggio.dart';
import 'package:codice/model/scudo.dart';
import 'package:codice/model/spada.dart';
import 'package:codice/model/stanza.dart';
import 'package:codice/theme/game_theme.dart';
import 'package:flutter/material.dart';

class OggettoListTile extends StatelessWidget {
  OggettoListTile(
      {Key? key,
      required this.oggetto,
      required this.personaggio,
      required this.partita})
      : super(key: key);

  final Oggetto oggetto;
  final Personaggio personaggio;
  final Partita partita;
  late final Stanza stanza = partita.getStanzaCorrente();

  void checkOggetto(context) {
    if (oggetto is Amuleto) {
      oggetto.usa(personaggio, oggetto, context);
    }

    // SPADA
    else if (oggetto is Spada) {
      oggetto.usa(personaggio, oggetto, context);
    }

    // SCUDO
    else if (oggetto is Scudo) {
      oggetto.usa(personaggio, oggetto, context);
    }

    // ARCO
    else {
      oggetto.usa(personaggio, oggetto, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Gestisco logica per quando un item viene cliccato
      onTap: () => checkOggetto(context),
      child: Card(
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
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

                const SizedBox(width: 30),

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
