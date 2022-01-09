import 'package:codice/database/oggettiDB.dart';
import 'package:codice/database/oggettiDB.dart';
import 'package:codice/functions/creazione_partita.dart';
import 'package:codice/model/combattimento.dart';
import 'package:codice/model/oggetto.dart';
import 'package:flutter/material.dart';
import 'azione.dart';

class Stanza {
  // L'index della stanza viene fornito quando viene creata la mappa al momento della creazine dell'istanza partita.
  late int _index;
  // Ogni volta che il bool = true, significa che bisogna mostrare l'immagine successiva sulla pagina.
  final List<Map<String, bool>> dialogoStanza;
  final List<String> immagini;
  // Ogni azione corrisponde ad un bottone
  final List<Azione> azioniDisponibili;
  late Oggetto oggettoStanza;
  // Se la stanza non ha un combattimento la lista è vuota
  List<Combattimento> combattimento = [];
  // Quando la stanza viene creata viene deciso se ci saranno combattimenti o meno
  final bool isCombattimentoPresente;
  int currentImageIndex = 0;
  int currentDialogoIndex = 0;

  Stanza({
    required this.azioniDisponibili,
    required this.dialogoStanza,
    required this.immagini,
    this.isCombattimentoPresente = false,
  });

  // Quando una stanza viene inserita nella mappa, gli viene associato l'index della posizione e vengono creati gli eventuali
  // combattimenti
  void setIndex(int idx) {
    // prendo un oggetto a caso da quelli disponibili nel database
    print("AGGIUNGO OGGETTO + INDEX ALLA STANZA");

    oggettoStanza = OggettiDB().getOggetto();
    _index = idx;

    if (isCombattimentoPresente) {
      combattimento.add(CreazionePartita().creaCombattimento(_index));
    }
  }

  void increaseDialogoIndex() {
    print(dialogoStanza.length);

    if ((currentDialogoIndex + 1) >= dialogoStanza.length) {
      print("DIALOGO STANZA FINITO");
    } else {
      currentDialogoIndex++;
      print("CAMBIO DIALOGO");

      // Controllo se devo cambiare immagine
      if (dialogoStanza[currentDialogoIndex].values.single) {
        currentImageIndex++;
        print("CAMBIO IMMAGINE");
      }
    }
  }
}
