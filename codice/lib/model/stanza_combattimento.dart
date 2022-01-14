import 'package:codice/functions/creazione_partita.dart';
import 'package:codice/model/partita.dart';
import 'package:codice/model/stanza.dart';
import 'package:flutter/material.dart';
import 'nemico.dart';

class StanzaCombattimento extends Stanza {
  String immagineNemico = "";

  StanzaCombattimento()
      : super(
          azioniDisponibili: [],
        );

  @override
  void setIndex(int idx) {
    index = idx;
    // creo il nemico
    nemico = CreazionePartita().creaNemico(index);
    // setto come stato iniziale quello in cui dialoga con il giocatore
    nemico!.changeStatoNemico(StatoNemico.DIALOGO);
    immagineNemico = nemico!.immaginiNemico[nemico!.indexImmagineCorrente];
    immagineCorrente = nemico!.immagineSfondo;
    dialogoCorrente = nemico!.dialogoCorrente;
    azioniDisponibili = nemico!.azioniDisponibili;
  }

  @override
  void increaseDialogoIndex(bool isPulsanteRisposta, Partita partita,
      {context}) {
    print(nemico!.statoNemico);
    if (!isPulsanteRisposta && nemico!.statoNemico == StatoNemico.DOMANDA) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 1000),
          content:
              Text("Per avanzare rispondere usando i pulsanti disponibili"),
        ),
      );
      return;
    } else if (isPulsanteRisposta &&
        (nemico!.statoNemico == StatoNemico.TRISTE ||
            nemico!.statoNemico == StatoNemico.RISATA)) {
      dialogoCorrente = nemico!.dialogoCorrente;
      print("sp");
    } else {
      nemico!.prossimoDialogo(partita, context);
      immagineNemico = nemico!.immaginiNemico[nemico!.indexImmagineCorrente];
      dialogoCorrente = nemico!.dialogoCorrente;
      if (nemico!.statoNemico == StatoNemico.DOMANDA) {
        azioniDisponibili = nemico!.azioniDisponibili;
      } else {
        azioniDisponibili.clear();
      }
    }
  }

  /* // Trasformo le risposte delle domande in Azioni e li aggiungo alla lista azioniDisponibili
  void creazioneAzioni({context}) {
    // recupero domanda corrente
    Domanda domandaCorrente =
        nemico!.listaDomande[nemico!.indexDomandaCorrente];

    // Creo Azioni Risposte
    for (int i = 0; i < domandaCorrente.risposte.length; i++) {
      azioniDisponibili.add(
        Azione(
            f1: ({Stanza? s, Personaggio? p}) {
              // Se la risposta è quella corretta:
              if (domandaCorrente.soluzione == domandaCorrente.risposte[i]) {
                print("SOLUZIONE CORRETTA");
                nemico!.changeStatoNemico(StatoNemico.TRISTE);

                dialogoCorrente = "SOLUZIONE CORRETTA!";
                azioniDisponibili.clear();
              }
              // Se la risposta è quella errata:
              else {
                print("SOLUZIONE ERRATA");
                nemico!.changeStatoNemico(StatoNemico.RISATA);
                dialogoCorrente = "SOLUZIONE SBAGLIATA!";
                azioniDisponibili.clear();

                Provider.of<Personaggio>(context, listen: false)
                    .decrSalute(nemico!.danno);
              }
            },
            titoloPulsante: domandaCorrente.risposte[i]),
      );
    }
  } */
}
