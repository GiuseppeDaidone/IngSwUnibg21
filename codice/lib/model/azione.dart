import 'package:codice/model/personaggio.dart';
import 'package:codice/model/stanza.dart';

// Questa classe rappresenta l'azione disponibili nella pagina giocatore.
// Ogni stanza può avere un numero diverso di queste azioni

class Azione {
  // Funzione da eseguire quando il giocatore sceglie questa azione
  // La stanza ed il personaggio passati come parametri corrispondono al player e la stanza corrente in cui si trova. Servono per poter accedere ai loro metodi
  // e campi per poter creare più varietà di azioni dentro le stanze esplorazione
  final void Function({Stanza s, Personaggio p}) f1;
  final String titoloPulsante;

  Azione({required this.f1, required this.titoloPulsante});
}
