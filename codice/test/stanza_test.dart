import 'package:codice/model/esplorazione.dart';
import 'package:codice/model/stanza_esplorazione.dart';
import 'package:flutter_test/flutter_test.dart';

void main(List<String> args) {
  group("stanzaEsplorazione", () {
    StanzaEsplorazione stanzaEsplorazione = StanzaEsplorazione();
    // testSetIndex
    test("Controllo che setIndex crei l'eplorazione e l'oggetto", () {
      stanzaEsplorazione.setIndex(5);

      expect(stanzaEsplorazione.esplorazione, isNot(null));
      expect(stanzaEsplorazione.oggetto, isNot(null));
    });

    // controllo stato iniziale
    test(
        "controllo che lo stato iniziale dell'esplorazione impostato da setIndex sia dialogo",
        () {
      stanzaEsplorazione.setIndex(5);
      expect(stanzaEsplorazione.esplorazione!.statoEsplorazione,
          StatoEsplorazione.DIALOGO);
    });
  });
}
