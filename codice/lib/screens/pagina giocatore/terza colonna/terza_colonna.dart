import 'package:codice/model/partita.dart';
import 'package:codice/theme/game_theme.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:provider/provider.dart';

// CONTENUTO TERZA COLONNA
//
// Barra Progressione Partita

class TerzaColonna extends StatefulWidget {
  const TerzaColonna({Key? key}) : super(key: key);

  @override
  State<TerzaColonna> createState() => _TerzaColonnaState();
}

class _TerzaColonnaState extends State<TerzaColonna> {
  late Size _size;

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
      child: Consumer<Partita>(
        builder: (context, partita, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ImageStepper(
                  stepReachedAnimationEffect: Curves.decelerate,
                  enableNextPreviousButtons: false,
                  activeStepBorderColor: GameTheme.buttonColor,
                  activeStepBorderWidth: 10,
                  direction: Axis.vertical,
                  enableStepTapping: false,
                  images: [
                    for (int i = 0; i < partita.mappa.length; i++)
                      AssetImage(partita.mappa[i].immagineCorrente),
                  ],
                  activeStep: partita.getStanzaCorrente().index,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
