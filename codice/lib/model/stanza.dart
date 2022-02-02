import 'azione.dart';
import 'package:codice/utils/facade.dart';

abstract class Stanza {
  late int index;
  late final Oggetto oggetto;

  String immagineCorrente = "";
  String dialogoCorrente = "";
  late List<Azione> azioniDisponibili;
  Nemico? nemico;
  Esplorazione? esplorazione;

  Stanza();

  // Questo metodo viene chiamato quando la stanza è inserita dentro una mappa
  // In questo metodo:
  // - Viene associato un index alla stanza in base alla posizione nella mappa
  // - Viene associato il primo dialogo al dialogo corrente
  // - Viene associata la prima immagine dello sfondo
  // - altre funzioni in base al tipo di stanza
  void setIndex(int idx, {Esplorazione? ed}) {}

  // metodo per far avanzare il testo dentro la textbox
  bool? increaseDialogoIndex(bool isPulsanteRisposta, Partita partita) {}
}
