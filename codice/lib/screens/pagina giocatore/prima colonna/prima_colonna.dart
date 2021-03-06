import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:codice/screens/pagina%20giocatore/prima%20colonna/pulsante_inventario.dart';
import 'package:codice/screens/pagina%20giocatore/prima%20colonna/pulsante_menu.dart';
import 'package:codice/theme/game_fonts.dart';
import 'package:codice/utils/facade.dart';

// CONTENUTO PRIMA COLONNA
//
// Pulsante Menu, Overlay Info Giocatore, Pulsante Inventario

class PrimaColonna extends StatelessWidget {
  const PrimaColonna({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: GameTheme.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // PULSANTE MENU
          Container(
            margin: const EdgeInsets.all(25),
            child: const PulsanteMenu(),
          ),

          // OVERLAY INFO GIOCATORE
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: GameTheme.secondaryColor,
              ),
            ),
            margin: const EdgeInsets.all(25),
            child: Consumer<Personaggio>(
              builder: (context, personaggio, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Nome personaggio
                  Text(
                    personaggio.nome,
                    style: GameFonts().hallelujaFontBlack(size: 30),
                  ),

                  // Salute Attuale
                  AnimatedTextKit(
                    isRepeatingAnimation: false,
                    key: UniqueKey(),
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "HP: " + personaggio.getSalute().toString(),
                        speed: const Duration(milliseconds: 300),
                        textStyle: GameFonts().hallelujaFontBlack(size: 30),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ITEM EQUIPAGGIATO
          Provider.of<Personaggio>(context).oggettoEquipaggiato != null
              ? Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  height: 30,
                  child: Image.asset(
                    Provider.of<Personaggio>(context).oggettoEquipaggiato!.icon,
                  ),
                )
              : const SizedBox(),
          const Spacer(),

          // PULSANTE INVENTARIO
          Container(
            margin: const EdgeInsets.all(30),
            child: const PulsanteInventario(),
          )
        ],
      ),
    );
  }
}
