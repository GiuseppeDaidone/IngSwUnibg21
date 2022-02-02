import 'package:codice/functions/creazione_partita.dart';
import 'package:codice/model/stanza.dart';
import 'package:flutter/material.dart';

class Partita with ChangeNotifier {
  late int _indexStanzaCorrente;
  final DateTime _istanteInizioPartita = DateTime.now();
  final List<Stanza> mappa;
  Stanza? _stanzaCorrente;

  Partita() : mappa = CreazionePartita().creaMappa() {
    _indexStanzaCorrente = 0;
  }

  void updateState() => notifyListeners();

  DateTime getIstanteInizioPartita() => _istanteInizioPartita;
  int getIndexStanzaCorrente() => _indexStanzaCorrente;

  // Recupero l'istanza della Stanza in cui mi trovo attualmente. Se è null allora la prendo dalla mappa
  Stanza getStanzaCorrente() => _stanzaCorrente ??= mappa[_indexStanzaCorrente];

  // Aggiorno l'index alla stanza successiva e aggiorno l'istanza di _stanzaCorrente
  void goStanzaSuccessiva() {
    _indexStanzaCorrente++;
    if (_indexStanzaCorrente < mappa.length) {
      _stanzaCorrente = mappa[_indexStanzaCorrente];
    }
    notifyListeners();
  }
}
