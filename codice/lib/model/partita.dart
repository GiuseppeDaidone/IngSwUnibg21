import 'package:codice/functions/creazione_partita.dart';
import 'package:codice/model/stanza.dart';
import 'package:codice/screens/pagina%20finale/pagina_finale.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  // SETTERS
  void updateState() => notifyListeners();

  void aumentaDomandeSbagliate() => _totDomandeSbagliate++;

  void aumentaDomandeRisposte() => _totDomandeRisposte++;

  void aumentaOggettiUtilizzati() => _oggettiUtilizzati++;

  // GETTERS
  DateTime getIstanteInizioPartita() => _istanteInizioPartita;
  int getDomandeSbagliate() => _totDomandeSbagliate;
  int getDomandeRisposte() => _totDomandeRisposte;
  int getOggettiUtilizzati() => _oggettiUtilizzati;
  int getIndexStanzaCorrente() => _indexStanzaCorrente;

  // Recupero l'istanza della Stanza in cui mi trovo attualmente. Se è null allora la prendo dalla mappa
  Stanza getStanzaCorrente() {
    _stanzaCorrente ??= mappa[_indexStanzaCorrente];
    return _stanzaCorrente!;
  }

  // Aggiorno l'index alla stanza successiva e aggiorno l'istanza di _stanzaCorrente
  // Se non esiste una stanza successiva allora sono a fondo mappa e quindi mostro la pagina finale
  void goStanzaSuccessiva({truecontext}) {
    if (_indexStanzaCorrente + 1 == mappa.length) {
      Navigator.push(
        truecontext,
        MaterialPageRoute(
          builder: (context) {
            return ChangeNotifierProvider<Partita>(
              create: (_) => Provider.of<Partita>(truecontext),
              builder: (context, partita) {
                return PaginaFinale(
                  isDead: false,
                );
              },
            );
          },
        ),
      );
    } else {
      _indexStanzaCorrente++;
      _stanzaCorrente = mappa[_indexStanzaCorrente];
    }
  }
}
