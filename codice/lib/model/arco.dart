import 'dart:math';
import 'package:codice/database/domandeDB.dart';
import 'package:codice/model/oggetto.dart';
import 'package:codice/model/partita.dart';
import 'package:codice/model/personaggio.dart';
import 'package:codice/model/stanza.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'domanda.dart';
import 'nemico.dart';

class Arco extends Oggetto {
  Arco({required String name})
      : super(
          name: name,
          icon: "images/arcoIcon.png",
        );

  @override
  void usa(Personaggio p, Oggetto o, BuildContext context, Stanza stanza) {
    Partita partita = Provider.of<Partita>(context, listen: false);

    if (stanza.nemico != null &&
        stanza.nemico!.statoNemico == StatoNemico.DOMANDA) {
      List<Domanda> listaDomande = DomandeDB()
          .listaDomande
          .where((element) => element.disciplina == stanza.nemico!.disciplina)
          .toList();
      Domanda newDomanda = listaDomande[Random().nextInt(listaDomande.length)];
      stanza.azioniDisponibili.clear();
      stanza.nemico!.creazioneAzioni(newDomanda, context: context);
      stanza.dialogoCorrente = newDomanda.testoDomanda;
      p.eliminaOggetto(o);
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
