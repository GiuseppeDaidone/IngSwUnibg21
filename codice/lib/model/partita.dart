import 'package:codice/model/stanza.dart';
import 'package:flutter/cupertino.dart';

class Partita with ChangeNotifier {
  late int _totDomandeSbagliate;
  late int _totDomandeRisposte;
  late int _oggettiUtilizzati;
  late int indexStanzaCorrente;
  final DateTime _istanteInizioPartita = DateTime.now();
  final List<Stanza> mappa = [];

  Partita() {
    _totDomandeRisposte = 0;
    _totDomandeSbagliate = 0;
    _oggettiUtilizzati = 0;
    indexStanzaCorrente = 0;
  }
  void aumentaDomandeSbagliate() => _totDomandeSbagliate++;

  void aumentaDomandeRisposte() => _totDomandeRisposte++;

  void aumentaOggettiUtilizzati() => _oggettiUtilizzati++;

  int getTotDomandeSbagliate() => _totDomandeSbagliate;

  DateTime getIstanteInizioPartita() => _istanteInizioPartita;

  int getTotDomandeRisposte() => _totDomandeRisposte;

  int getOggettiUtilizzati() => _oggettiUtilizzati;

  int getIndexStanzaCorrente() => indexStanzaCorrente;

  void goStanzaSuccessiva() => indexStanzaCorrente++;
}
