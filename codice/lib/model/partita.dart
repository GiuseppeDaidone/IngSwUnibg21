import 'package:codice/functions/creazione_partita.dart';
import 'package:codice/model/stanza.dart';
import 'package:codice/screens/pagina%20finale/pagina_finale.dart';
import 'package:flutter/material.dart';

class Partita with ChangeNotifier {
  late int _totDomandeSbagliate;
  late int _totDomandeRisposte;
  late int _oggettiUtilizzati;
  late int _indexStanzaCorrente;
  final DateTime _istanteInizioPartita = DateTime.now();
  final List<Stanza> mappa;
  Stanza? _stanzaCorrente;

  Partita() : mappa = CreazionePartita().creaMappa() {
    _totDomandeRisposte = 0;
    _totDomandeSbagliate = 0;
    _oggettiUtilizzati = 0;
    _indexStanzaCorrente = 0;
  }

  void updateState() => notifyListeners();

  void aumentaDomandeSbagliate() => _totDomandeSbagliate++;

  void aumentaDomandeRisposte() => _totDomandeRisposte++;

  void aumentaOggettiUtilizzati() => _oggettiUtilizzati++;

  int getIndexStanzaCorrente() => _indexStanzaCorrente;

  // Recupero l'istanza della Stanza in cui mi trovo attualmente. Se è null allora la prendo dalla mappa
  Stanza getStanzaCorrente() {
    _stanzaCorrente ??= mappa[_indexStanzaCorrente];
    return _stanzaCorrente!;
  }

  // Aggiorno l'index alla stanza successiva e aggiorno l'istanza di _stanzaCorrente
  // Se non esiste una stanza successiva allora sono a fondo mappa e quindi mostro la pagina finale
  void goStanzaSuccessiva({context}) {
    if (_indexStanzaCorrente + 1 == mappa.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const PaginaFinale();
          },
        ),
      );
    } else {
      _indexStanzaCorrente++;
      _stanzaCorrente = mappa[_indexStanzaCorrente];
    }
  }
}
