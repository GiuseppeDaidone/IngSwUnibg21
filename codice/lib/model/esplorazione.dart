import 'package:codice/model/partita.dart';
import 'azione.dart';

class Esplorazione {
  Esplorazione(
      {required this.immaginiSfondo,
      required this.dialogoEsplorazione,
      required this.azioniDisponibili});

  final List<String> immaginiSfondo;
  final List<Map<String, bool>> dialogoEsplorazione;
  late StatoEsplorazione statoEsplorazione;

  final List<Azione> azioniDisponibili;

  String dialogoCorrente = "";

  int indexImmagineCorrente = 0;
  int indexDialogoCorrente = 0;

  void changeStatoEsplorazione(StatoEsplorazione st) {
    switch (st) {
      case StatoEsplorazione.DIALOGO:
        statoEsplorazione = st;
        break;

      case StatoEsplorazione.AZIONE:
        statoEsplorazione = st;
        break;
    }
  }

  // questa funzione può venir chiamata quando viene premuto il gesture detector oppure uno dei pulsanti azione
  void prossimoDialogo(Partita partita) {
    // Controllo che ci sia ancora del dialogo
    if (indexDialogoCorrente + 1 < dialogoEsplorazione.length) {
      indexDialogoCorrente++;
      dialogoCorrente = dialogoEsplorazione[indexDialogoCorrente].keys.first;
      // Se il dialogo nuovo deve mostrare anche un'azione, mostro l'azione e cambio anche l'immagine sfondo
      if (dialogoEsplorazione[indexDialogoCorrente].values.first) {
        changeStatoEsplorazione(StatoEsplorazione.AZIONE);
        if (indexImmagineCorrente + 1 < immaginiSfondo.length) {
          indexImmagineCorrente++;
        }
      }
    }

    // Se non è disponibile altro dialogo cambio pagina
    else {
      partita.goStanzaSuccessiva();
    }
  }
}

enum StatoEsplorazione { DIALOGO, AZIONE }
