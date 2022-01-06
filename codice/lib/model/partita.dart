import 'package:codice/model/stanza.dart';

class Partita {
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

  void aumentaDomandeRisposte() {
    _totDomandeRisposte++;
  }

  void aumentaOggettiUtilizzati() {
    _oggettiUtilizzati++;
  }

  int getTotDomandeSbagliate() {
    return _totDomandeSbagliate;
  }

  DateTime getIstanteInizioPartita() {
    return _istanteInizioPartita;
  }

  int getTotDomandeRisposte() {
    return _totDomandeRisposte;
  }

  int getOggettiUtilizzati() {
    return _oggettiUtilizzati;
  }

  int getIndexStanzaCorrente() {
    return indexStanzaCorrente;
  }

  void goStanzaSuccessiva() {
    indexStanzaCorrente++;
  }
}
