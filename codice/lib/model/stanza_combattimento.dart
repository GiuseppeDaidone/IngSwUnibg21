import 'package:codice/functions/creazione_partita.dart';
import 'package:codice/utils/facade.dart';

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
  bool? increaseDialogoIndex(
    bool isPulsanteRisposta,
    Partita partita,
  ) {
    if (!isPulsanteRisposta && nemico!.statoNemico == StatoNemico.DOMANDA) {
      return true;
    }

    // Se ho appena risposto ad una domanda mostro la risata/tristezza del nemico
    else if (isPulsanteRisposta && (nemico!.statoNemico == StatoNemico.TRISTE || nemico!.statoNemico == StatoNemico.RISATA)) {
      dialogoCorrente = nemico!.dialogoCorrente;
    } else {
      nemico!.prossimoDialogo(partita);
      dialogoCorrente = nemico!.dialogoCorrente;
      // mostro le azioni per rispondere alla domanda se ho una domanda
      if (nemico!.statoNemico == StatoNemico.DOMANDA) {
        azioniDisponibili = nemico!.azioniDisponibili;
      } else {
        azioniDisponibili.clear();
      }
    }
    return false;
  }
}
