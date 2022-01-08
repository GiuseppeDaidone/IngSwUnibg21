import 'package:codice/model/partita.dart';
import 'package:codice/screens/pagina%20giocatore/seconda%20colonna/action_button.dart';
import 'package:codice/screens/pagina%20giocatore/widgets%20pagina%20giocatore/pulsante_inventario.dart';
import 'package:codice/screens/pagina%20giocatore/widgets%20pagina%20giocatore/pulsante_menu.dart';
import 'package:codice/screens/pagina%20home/pagina_home.dart';
import 'package:codice/theme/game_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// CONTENUTO SECONDA COLONNA
//
// ImageBox, TextStoryBox, ActionButtons

class SecondaColonna extends StatefulWidget {
  const SecondaColonna({Key? key}) : super(key: key);

  @override
  State<SecondaColonna> createState() => _SecondaColonnaState();
}

class _SecondaColonnaState extends State<SecondaColonna> {
  final bool isPrimaAzioneActive = true;

  final bool isSecondaAzioneActive = true;

  final bool isTerzaAzioneActive = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Provider.of<Partita>(context, listen: false)
            .getStanzaCorrente()
            .increaseDialogoIndex();

        // Aggiorno lo stato di partita, dato che se aggiorno l'istanza Stanza non trigghera il notifylisteners di Partita da solo
        Provider.of<Partita>(context, listen: false).updateState();
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: GameTheme.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: <Widget>[
            Consumer<Partita>(
              builder: (context, partita, _) {
                return Expanded(
                  flex: 6,
                  child: Column(
                    children: [
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
                              child: Image.asset(
                                  partita.getStanzaCorrente().immagini[partita
                                      .getStanzaCorrente()
                                      .currentImageIndex]),
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
                          child: Text(partita
                              .getStanzaCorrente()
                              .dialogoStanza[partita
                                  .getStanzaCorrente()
                                  .currentDialogoIndex]
                              .keys
                              .single),
                        ),
                      ),
                    ],
                  ),
                );
              },
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
      ),
    );
  }
}
