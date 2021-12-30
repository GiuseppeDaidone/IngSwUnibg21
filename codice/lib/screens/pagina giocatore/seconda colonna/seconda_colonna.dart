import 'package:codice/screens/pagina%20giocatore/widgets%20pagina%20giocatore/pulsante_inventario.dart';
import 'package:codice/screens/pagina%20giocatore/widgets%20pagina%20giocatore/pulsante_menu.dart';
import 'package:codice/screens/pagina_home.dart';
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
      color: Colors.purple,
      child: Column(
        children: <Widget>[
          // IMAGE BOX
          Expanded(
            flex: 6,
            child: Container(
              margin: EdgeInsets.only(top: 20),
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
            child: Container(
              width: size.width / 2,
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Primo action button
                    isPrimaAzioneActive
                        ? Container(
                            height: 70,
                            width: size.width / 8,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text("Prima Azione"),
                            ),
                          )
                        : const SizedBox(),

                    // Secondo action button
                    isSecondaAzioneActive
                        ? Container(
                            height: 70,
                            width: size.width / 8,
                            margin: const EdgeInsets.only(right: 20, left: 20),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text("Seconda Azione"),
                            ),
                          )
                        : const SizedBox(),

                    // Terzo action button
                    isTerzaAzioneActive
                        ? Container(
                            height: 70,
                            width: size.width / 8,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text("Terza Azione"),
                            ),
                          )
                        : const SizedBox()
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
