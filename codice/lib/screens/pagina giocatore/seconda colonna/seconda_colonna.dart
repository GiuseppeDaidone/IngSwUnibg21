import 'package:codice/screens/pagina%20giocatore/seconda%20colonna/action_button.dart';
import 'package:codice/screens/pagina%20giocatore/widgets%20pagina%20giocatore/pulsante_inventario.dart';
import 'package:codice/screens/pagina%20giocatore/widgets%20pagina%20giocatore/pulsante_menu.dart';
import 'package:codice/screens/pagina%20home/pagina_home.dart';
import 'package:codice/theme/game_theme.dart';
import 'package:flutter/material.dart';

// CONTENUTO SECONDA COLONNA
//
// ImageBox, TextStoryBox, ActionButtons

class SecondaColonna extends StatelessWidget {
  const SecondaColonna({Key? key}) : super(key: key);

  final bool isPrimaAzioneActive = true;
  final bool isSecondaAzioneActive = true;
  final bool isTerzaAzioneActive = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: GameTheme.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          // IMAGE BOX
          Expanded(
            flex: 6,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              // dimensioni immagine
              width: size.width / 2,
              height: size.height / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FittedBox(
                  child: Image.asset("images/dun.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          // TEXT STORY BOX
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green[800],
              ),
              width: size.width / 2,
              height: size.height / 5,
              child: const Text("djsdh"),
            ),
          ),

          // ACTION BUTTONS
          Expanded(
            flex: 2,
            child: SizedBox(
              width: size.width / 2,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Primo action button
                  isPrimaAzioneActive
                      ? ActionButton(
                          nomePulsante: "Prima Azione",
                          onPressed: () {},
                        )
                      : const SizedBox(),

                  // Secondo action button
                  isSecondaAzioneActive
                      ? ActionButton(
                          nomePulsante: "Seconda Azione",
                          onPressed: () {},
                        )
                      : const SizedBox(),

                  // Terzo action button
                  isTerzaAzioneActive
                      ? ActionButton(
                          nomePulsante: "Terza Azione",
                          onPressed: () {},
                        )
                      : const SizedBox()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
