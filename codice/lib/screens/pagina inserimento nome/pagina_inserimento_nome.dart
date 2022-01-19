import 'package:codice/screens/pagina%20inserimento%20nome/textfield_nome.dart';
import 'package:codice/theme/game_fonts.dart';
import 'package:flutter/material.dart';

// [PAG2]
class PaginaInserimentoNome extends StatelessWidget {
  const PaginaInserimentoNome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Immagine sfondo
          SizedBox(
            height: size.height,
            width: size.width,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Center(
                child: Image.asset("images/homegif.gif"),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // TITLE
                Text(
                  "Inserisci il tuo nickname",
                  style: GameFonts().hallelujaFont(size: 40),
                ),

                // TEXTFIELD + PULSANTE INVIO
                const TextFieldNome(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
