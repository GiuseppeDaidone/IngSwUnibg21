import 'package:codice/model/partita.dart';
import 'package:codice/screens/pagina%20giocatore/seconda%20colonna/action_button.dart';
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<Partita>(builder: (context, partita, _) {
      return Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: GameTheme.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: GestureDetector(
                    onTap: () {
                      // Quando premo sulla parte centrale dello schermo vado avanti con il dialogo. A meno che non siano presenti delle
                      // azioni. Inoltre se il dialogo della stanza è finito vado alla stanza successiva
                      if (partita
                          .getStanzaCorrente()
                          .increaseDialogoIndex(false, partita, context)) {
                        partita.goStanzaSuccessiva(context);
                      }

                      // Aggiorno lo stato di partita, dato che se aggiorno l'istanza Stanza non trigghera il notifylisteners di Partita da solo
                      partita.updateState();
                    },
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
                  ),
                ),

                // ACTION BUTTONS
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          // Lista Pulsanti
                          child:
                              // mostro i pulsanti per le azioni solamente quando serve
                              partita
                                      .getStanzaCorrente()
                                      .dialogoStanza[partita
                                          .getStanzaCorrente()
                                          .currentDialogoIndex]
                                      .values
                                      .first
                                  ? ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: partita
                                          .getStanzaCorrente()
                                          .azioniDisponibili
                                          .length,
                                      itemBuilder: (context, index) {
                                        return partita
                                                .getStanzaCorrente()
                                                .azioniDisponibili
                                                .isNotEmpty
                                            ? ActionButton(
                                                nomePulsante: partita
                                                    .getStanzaCorrente()
                                                    .azioniDisponibili[index]
                                                    .titoloPulsante,
                                                onPressed: () {
                                                  partita
                                                      .getStanzaCorrente()
                                                      .azioniDisponibili[index]
                                                      .f1();

                                                  // Ogni volta che un pulsante risposta viene premuto vado al dialogo successivo
                                                  partita
                                                      .getStanzaCorrente()
                                                      .increaseDialogoIndex(
                                                          true,
                                                          partita,
                                                          context);

                                                  // Aggiorno la pagina
                                                  partita.updateState();
                                                },
                                              )
                                            : const SizedBox(
                                                height: 30,
                                                width: 20,
                                              );
                                      },
                                    )
                                  : const SizedBox(),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
