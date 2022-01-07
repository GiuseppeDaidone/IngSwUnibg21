import 'package:codice/functions/creazione_partita.dart';
import 'package:codice/model/stanza.dart';
import 'package:flutter/cupertino.dart';

// FLOW CHART:
// Quando viene inserito nome utente viene creata una istanza di Partita(). Il suo costruttore chiama la funzione createMappa() che
// riempie di stanze l'attributo mappa pescando stanze dal database stanzeDB.
// Le stanze sono già create e presenti nel database prima che la partita inizi. Quando una stanza viene pescata per essere messa
// nella mappa, gli viene associato l'index in cui si trova nella mappa tramite il metodo setIndex(). Questo metodo fa anche partire la
// creazione del combattimento (nel caso ce ne sia uno). La creazione delcombattimento è eseguita dalla funzione creaCombattimento() che
// crea un combattimento decidendo numero domande, nemico e difficoltà in base all'index della stanza che ha chiamato la funzione.

class Partita with ChangeNotifier {
  late int _totDomandeSbagliate;
  late int _totDomandeRisposte;
  late int _oggettiUtilizzati;
  late int indexStanzaCorrente;
  final DateTime _istanteInizioPartita = DateTime.now();
  final List<Stanza> mappa;

  Partita() : mappa = CreazionePartita().creaMappa() {
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
