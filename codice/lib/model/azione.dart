// Questa classe rappresenta l'azione disponibili nella pagina giocatore.
// Ogni stanza può avere un numero diverso di queste azioni

import 'package:flutter/cupertino.dart';

class Azione {
  // Funzione da eseguire quando il giocatore sceglie questa azione
  final VoidCallback f1;
  final String titoloPulsante;

  Azione({required this.f1, required this.titoloPulsante});
}
