import 'package:codice/database/oggettiDB.dart';
import 'package:codice/model/esplorazione.dart';
import 'package:codice/model/partita.dart';
import 'package:codice/model/stanza.dart';
import 'package:flutter/material.dart';

class StanzaEsplorazione extends Stanza {
  StanzaEsplorazione() : super();

  @override
  void setIndex(int idx, {Esplorazione? ed}) {
    index = idx;
    // imposto il primo dialogo
    esplorazione = ed;
    azioniDisponibili = esplorazione!.azioniDisponibili;
    dialogoCorrente = esplorazione!
        .dialogoEsplorazione[esplorazione!.indexDialogoCorrente].keys.first;
    // imposto la prima immagine
    immagineCorrente =
        esplorazione!.immaginiSfondo[esplorazione!.indexImmagineCorrente];
    // creo l'oggetto
    oggetto = OggettiDB().getOggetto();
    // imposto lo stato
    esplorazione!.changeStatoEsplorazione(StatoEsplorazione.DIALOGO);
  }

  @override
  void increaseDialogoIndex(bool isPulsanteRisposta, Partita partita,
      {context}) {
    // Se viene premuto il gesture detector quando un'azione è già presente
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
      // passo al prossimo dialogo
      esplorazione!.prossimoDialogo(partita);
      immagineCorrente =
          esplorazione!.immaginiSfondo[esplorazione!.indexImmagineCorrente];
      dialogoCorrente = esplorazione!.dialogoCorrente;
      // Se ho uno stato azione mostro le azioni disponibili
      if (esplorazione!.statoEsplorazione == StatoEsplorazione.AZIONE) {
        azioniDisponibili = esplorazione!.azioniDisponibili;
      }
    }
  }
}
