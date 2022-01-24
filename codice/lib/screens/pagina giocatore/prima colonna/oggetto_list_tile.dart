import 'package:codice/database/domandeDB.dart';
import 'package:codice/model/amuleto.dart';
import 'package:codice/model/domanda.dart';
import 'package:codice/model/nemico.dart';
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
    // AMULETO
    if (oggetto is Amuleto) {
      if (!oggetto.isMalefico) {
        personaggio.incrSalute(oggetto.getEffetto()!);
      } else {
        personaggio.decrSalute(oggetto.getEffetto()!, context);
      }

      personaggio.eliminaOggetto(oggetto);
      Navigator.pop(context);
    }

    // SPADA
    else if (oggetto is Spada) {
      if (personaggio.oggettoEquipaggiato != null &&
          personaggio.oggettoEquipaggiato!.getId() == oggetto.getId()) {
        personaggio.disequipaggiaOggetto();
      } else {
        personaggio.equipaggiaOggetto(oggetto);
      }
    }

    // SCUDO
    else if (oggetto is Scudo) {
      if (personaggio.oggettoEquipaggiato != null &&
          personaggio.oggettoEquipaggiato!.getId() == oggetto.getId()) {
        personaggio.disequipaggiaOggetto();
      } else {
        personaggio.equipaggiaOggetto(oggetto);
      }
    }

    // ARCO
    else {
      // Controllo se è attualmente mostrata una domanda
      if (stanza.nemico != null &&
          stanza.nemico!.statoNemico == StatoNemico.DOMANDA) {
        Domanda newDomanda = DomandeDB().getDomanda();
        stanza.azioniDisponibili.clear();
        stanza.nemico!.creazioneAzioni(newDomanda);
        stanza.dialogoCorrente = newDomanda.testoDomanda;
        personaggio.eliminaOggetto(oggetto);
        Navigator.pop(context);
        partita.updateState();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Puoi usare questo oggetto solamente durante una domanda",
            ),
          ),
        );
      }
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
