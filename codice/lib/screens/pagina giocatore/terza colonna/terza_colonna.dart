import 'package:codice/screens/pagina%20giocatore/widgets%20pagina%20giocatore/pulsante_inventario.dart';
import 'package:codice/screens/pagina%20giocatore/widgets%20pagina%20giocatore/pulsante_menu.dart';
import 'package:codice/screens/pagina%20home/pagina_home.dart';
import 'package:codice/theme/game_theme.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

// CONTENUTO TERZA COLONNA
//
// Barra Progressione Partita

class TerzaColonna extends StatefulWidget {
  const TerzaColonna({Key? key}) : super(key: key);

  @override
  State<TerzaColonna> createState() => _TerzaColonnaState();
}

class _TerzaColonnaState extends State<TerzaColonna> {
  // Step su cui mi trovo al momento
  late int _activeStep;
  late Size _size;

  @override
  void initState() {
    _activeStep = 0;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: GameTheme.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      height: _size.height,
      width: _size.width / 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ImageStepper(
              enableNextPreviousButtons: false,
              activeStepBorderWidth: 5,
              direction: Axis.vertical,
              images: [
                AssetImage("images/homegif.gif"),
                AssetImage("images/dun.jpg"),
                AssetImage("images/dun.jpg"),
                AssetImage("images/dun.jpg"),
                AssetImage("images/dun.jpg"),
                AssetImage("images/dun.jpg"),
                AssetImage("images/dun.jpg"),
                AssetImage("images/homegif.gif")
              ],
              activeStep: _activeStep,
              onStepReached: (index) {
                setState(() {
                  _activeStep = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
