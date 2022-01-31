import 'package:codice/functions/creazione_partita.dart';
import 'package:codice/model/esplorazione.dart';
import 'package:codice/model/partita.dart';
import 'package:codice/model/stanza.dart';
import 'package:flutter/material.dart';
import 'nemico.dart';

class StanzaCombattimento extends Stanza {
  StanzaCombattimento() : super();

  @override
  void setIndex(int idx, {Esplorazione? ed}) {
    index = idx;
    // creo il nemico
    nemico = CreazionePartita().creaNemico(index);
    // setto come stato iniziale quello in cui dialoga con il giocatore
    nemico!.changeStatoNemico(StatoNemico.DIALOGO);
    nemico!.setDannoNemico();
    immagineCorrente = nemico!.immagineSfondo;
    dialogoCorrente = nemico!.dialogoCorrente;
    azioniDisponibili = nemico!.azioniDisponibili;
  }

  @override
  void increaseDialogoIndex(bool isPulsanteRisposta, Partita partita,
      {context}) {
    if (!isPulsanteRisposta && nemico!.statoNemico == StatoNemico.DOMANDA) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 1000),
          content:
              Text("Per avanzare rispondere usando i pulsanti disponibili"),
        ),
      );
      return;
    }

    // Se ho appena risposto ad una domanda mostro la risata/tristezza del nemico
    else if (isPulsanteRisposta &&
        (nemico!.statoNemico == StatoNemico.TRISTE ||
            nemico!.statoNemico == StatoNemico.RISATA)) {
      dialogoCorrente = nemico!.dialogoCorrente;
    } else {
      nemico!.prossimoDialogo(partita, context);
      dialogoCorrente = nemico!.dialogoCorrente;
      // mostro le azioni per rispondere alla domanda se ho una domanda
      if (nemico!.statoNemico == StatoNemico.DOMANDA) {
        azioniDisponibili = nemico!.azioniDisponibili;
      } else {
        azioniDisponibili.clear();
      }
    }
  }
}
