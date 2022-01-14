import 'package:codice/model/esplorazione.dart';
import 'package:codice/model/nemico.dart';
import 'package:codice/model/partita.dart';
import 'azione.dart';

abstract class Stanza {
  late int index;

  String immagineCorrente = "";
  String dialogoCorrente = "";
  late List<Azione> azioniDisponibili;
  late Nemico? nemico;
  late Esplorazione? esplorazione;

  Stanza({required this.azioniDisponibili, this.nemico, this.esplorazione});

  // Questo metodo viene chiamato quando la stanza è inserita dentro una mappa
  // In questo metodo:
  // - Viene associato un index alla stanza in base alla posizione nella mappa
  // - Viene associato il primo dialogo al dialogo corrente
  // - Viene associata la prima immagine dello sfondo
  // - altre funzioni in base al tipo di stanza
  void setIndex(int idx) {}

  // metodo per far avanzare il testo dentro la textbox
  void increaseDialogoIndex(bool isPulsanteRisposta, Partita partita,
      {context}) {}
}
