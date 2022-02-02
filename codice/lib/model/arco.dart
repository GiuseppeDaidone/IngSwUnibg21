import 'dart:math';
import 'package:codice/database/domandeDB.dart';
import 'package:codice/model/oggetto.dart';
import 'package:codice/model/personaggio.dart';
import 'package:codice/model/stanza.dart';
import 'domanda.dart';

class Arco extends Oggetto {
  Arco({required String name})
      : super(
          name: name,
          icon: "images/arcoIcon.png",
        );

  @override
  void usa(Personaggio p, Oggetto o, Stanza stanza) {
    List<Domanda> listaDomande = DomandeDB().listaDomande.where((element) => element.disciplina == stanza.nemico!.disciplina).toList();
    Domanda newDomanda = listaDomande[Random().nextInt(listaDomande.length)];
    stanza.azioniDisponibili.clear();
    stanza.nemico!.creazioneAzioni(newDomanda);
    stanza.dialogoCorrente = newDomanda.testoDomanda;
    p.eliminaOggetto(o);
  }
}
