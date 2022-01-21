import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:codice/model/azione.dart';
import 'package:codice/model/nemico.dart';
import 'package:codice/model/partita.dart';
import 'package:codice/model/stanza.dart';
import 'package:codice/screens/pagina%20giocatore/seconda%20colonna/action_buttons_row.dart';
import 'package:codice/theme/game_fonts.dart';
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
    List<Azione> _azioniDisponibili;
    Stanza _stanzaCorrente;
    Nemico? _nemico;
    return Consumer<Partita>(
      builder: (context, partita, _) {
        _stanzaCorrente = partita.getStanzaCorrente();
        _azioniDisponibili = _stanzaCorrente.azioniDisponibili;
        _nemico = _stanzaCorrente.nemico;
//        var cc = TyperAnimatedText(_stanzaCorrente.dialogoCorrente);

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
                        _stanzaCorrente.increaseDialogoIndex(false, partita,
                            context: context);

                        // Aggiorno lo stato di partita, dato che se aggiorno l'istanza Stanza non trigghera il notifylisteners di Partita da solo
                        partita.updateState();
                      },
                      child: Column(
                        children: [
                          // IMAGE BOX
                          Expanded(
                            flex: 6,
                            child: Stack(
                              children: [
                                // IMMAGINE SFONDO
                                Container(
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
                                        _stanzaCorrente.immagineCorrente,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),

                                // GIF NEMICO
                                _nemico != null
                                    ? Positioned(
                                        bottom: 0,
                                        left: 50,
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 20),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                _nemico!.immaginiNemico[_nemico!
                                                    .indexImmagineCorrente],
                                              ),
                                            ),
                                          ),
                                          // dimensioni immagine
                                          width: size.width / 4,
                                          height: size.height / 4,
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
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
                              child: AnimatedTextKit(
                                key: UniqueKey(),
                                onTap: () {
                                  _stanzaCorrente.increaseDialogoIndex(
                                      false, partita,
                                      context: context);

                                  // Aggiorno lo stato di partita, dato che se aggiorno l'istanza Stanza non trigghera il notifylisteners di Partita da solo
                                  partita.updateState();
                                },
                                isRepeatingAnimation: false,
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    _stanzaCorrente.dialogoCorrente,
                                    speed: const Duration(milliseconds: 60),
                                    textStyle: GameFonts().hallelujaFontBlack(
                                      size: 20,
                                    ),
                                  )
                                ],
                              ),
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
                      margin: const EdgeInsets.all(30),
                      child: ActionButtonsRow(
                        azioniDisponibili: _azioniDisponibili,
                        partita: partita,
                        stanzaCorrente: _stanzaCorrente,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
