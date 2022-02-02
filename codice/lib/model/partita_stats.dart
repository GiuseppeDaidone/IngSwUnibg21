class PartitaStats {
  late int _totDomandeSbagliate;
  late int _totDomandeRisposte;
  late int _oggettiUtilizzati;
  late DateTime _istanteInizioPartita;

  PartitaStats() : super() {
    resetStats();
  }

  // resetto le statistiche
  void resetStats() {
    _totDomandeRisposte = 0;
    _totDomandeSbagliate = 0;
    _oggettiUtilizzati = 0;
    _istanteInizioPartita = DateTime.now();
  }

  // SETTERS
  void aumentaDomandeSbagliate() => _totDomandeSbagliate++;
  void aumentaDomandeRisposte() => _totDomandeRisposte++;
  void aumentaOggettiUtilizzati() => _oggettiUtilizzati++;

  // GETTERS
  DateTime getIstanteInizioPartita() => _istanteInizioPartita;
  int getDomandeSbagliate() => _totDomandeSbagliate;
  int getDomandeRisposte() => _totDomandeRisposte;
  int getOggettiUtilizzati() => _oggettiUtilizzati;
}
