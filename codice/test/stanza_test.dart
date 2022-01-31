import 'package:codice/database/esplorazioneDB.dart';
import 'package:codice/model/esplorazione.dart';
import 'package:codice/model/partita.dart';
import 'package:codice/model/stanza_combattimento.dart';
import 'package:codice/model/stanza_esplorazione.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("stanzaEsplorazione", () {
    test("Controllo che il campo nemico sia nullo", () {
      StanzaEsplorazione s = StanzaEsplorazione();
      expect(s.nemico, null);
    });

    test("Controllo che setIndex crei l'eplorazione e l'oggetto", () {
      StanzaEsplorazione stanzaEsplorazione = StanzaEsplorazione();
      stanzaEsplorazione.setIndex(5, ed: EsplorazioneDB().listaEsplorazioni[0]);
      expect(stanzaEsplorazione.esplorazione, isNot(null));
      expect(stanzaEsplorazione.oggetto, isNot(null));
    });

    test(
        "controllo che lo stato iniziale dell'esplorazione impostato da setIndex sia dialogo",
        () {
      StanzaEsplorazione stanzaEsplorazione = StanzaEsplorazione();
      stanzaEsplorazione.setIndex(5, ed: EsplorazioneDB().listaEsplorazioni[0]);
      expect(stanzaEsplorazione.esplorazione!.statoEsplorazione,
          StatoEsplorazione.DIALOGO);
    });

    test(
        "controllo che prossimoDialogo() aggiorni l'index del dialogo corrente",
        () {
      StanzaEsplorazione stanzaEsplorazione = StanzaEsplorazione();
      stanzaEsplorazione.setIndex(5, ed: EsplorazioneDB().listaEsplorazioni[0]);
      stanzaEsplorazione.esplorazione!.prossimoDialogo(Partita());
      expect(stanzaEsplorazione.esplorazione!.indexDialogoCorrente, 1);
    });
  });

  group("stanzaCombattimento", () {
    test("Controllo che setIndex crei il nemico ed imposti il danno", () {
      StanzaCombattimento s = StanzaCombattimento();
      s.setIndex(1);
      expect(s.nemico, isNot(null));
      expect(s.nemico!.danno, isNot(null));
    });

    test("Controllo che il campo esplorazione sia nullo", () {
      StanzaCombattimento s = StanzaCombattimento();
      expect(s.esplorazione, null);
    });

    test("controllo che increaseDialogoIndex aumenti index dialogo", () {
      StanzaCombattimento s = StanzaCombattimento();
      s.setIndex(1);
      s.increaseDialogoIndex(false, Partita());
      expect(s.nemico!.indexDialogoCorrente, 1);
    });
  });
}
