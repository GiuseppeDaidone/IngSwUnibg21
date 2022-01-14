import 'package:codice/database/oggettiDB.dart';
import 'package:codice/functions/creazione_partita.dart';
import 'package:codice/model/esplorazione.dart';
import 'package:codice/model/oggetto.dart';
import 'package:codice/model/partita.dart';
import 'package:codice/model/stanza.dart';
import 'package:flutter/material.dart';

class StanzaEsplorazione extends Stanza {
  late final Oggetto oggetto;

  StanzaEsplorazione({
    required azioniDisponibili,
  }) : super(
          azioniDisponibili: azioniDisponibili,
          esplorazione: CreazionePartita().creaEsplorazione(),
        );

  @override
  void setIndex(int idx) {
    index = idx;
    dialogoCorrente = esplorazione!
        .dialogoEsplorazione[esplorazione!.indexDialogoCorrente].keys.first;
    immagineCorrente =
        esplorazione!.immaginiSfondo[esplorazione!.indexImmagineCorrente];
    oggetto = OggettiDB().getOggetto();
    esplorazione!.statoEsplorazione = StatoEsplorazione.DIALOGO;
  }

  @override
  void increaseDialogoIndex(bool isPulsanteRisposta, Partita partita,
      {context}) {
    if (!isPulsanteRisposta &&
        esplorazione!.statoEsplorazione == StatoEsplorazione.AZIONE) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 1000),
          content:
              Text("Per avanzare rispondere usando i pulsanti disponibili"),
        ),
      );
      return;
    } else {
      esplorazione!.prossimoDialogo(partita);
      immagineCorrente =
          esplorazione!.immaginiSfondo[esplorazione!.indexImmagineCorrente];
      dialogoCorrente = esplorazione!.dialogoCorrente;
      // Se ho un azione da mostrare
      if (esplorazione!.statoEsplorazione == StatoEsplorazione.AZIONE) {
        azioniDisponibili = esplorazione!.azioniDisponibili;
      } else {
        azioniDisponibili.clear();
      }
    }
  }
}
