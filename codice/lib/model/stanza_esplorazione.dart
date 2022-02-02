import 'package:codice/database/oggettiDB.dart';
import 'package:codice/utils/facade.dart';

class StanzaEsplorazione extends Stanza {
  StanzaEsplorazione() : super();

  @override
  void setIndex(int idx, {Esplorazione? ed}) {
    index = idx;
    // imposto il primo dialogo
    esplorazione = ed;
    azioniDisponibili = esplorazione!.azioniDisponibili;
    dialogoCorrente = esplorazione!.dialogoEsplorazione[esplorazione!.indexDialogoCorrente].keys.first;
    // imposto la prima immagine
    immagineCorrente = esplorazione!.immaginiSfondo[esplorazione!.indexImmagineCorrente];
    // creo l'oggetto
    oggetto = OggettiDB().getOggetto();
    // imposto lo stato
    esplorazione!.changeStatoEsplorazione(StatoEsplorazione.DIALOGO);
  }

  @override
  bool? increaseDialogoIndex(
    bool isPulsanteRisposta,
    Partita partita,
  ) {
    // Se viene premuto il gesture detector quando un'azione è già presente
    if (!isPulsanteRisposta && esplorazione!.statoEsplorazione == StatoEsplorazione.AZIONE) {
      return true;
    } else {
      // passo al prossimo dialogo
      esplorazione!.prossimoDialogo(partita);
      immagineCorrente = esplorazione!.immaginiSfondo[esplorazione!.indexImmagineCorrente];
      dialogoCorrente = esplorazione!.dialogoCorrente;
      // Se ho uno stato azione mostro le azioni disponibili
      if (esplorazione!.statoEsplorazione == StatoEsplorazione.AZIONE) {
        azioniDisponibili = esplorazione!.azioniDisponibili;
      }
    }
    return false;
  }
}
