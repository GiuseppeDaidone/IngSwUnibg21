import 'package:codice/model/azione.dart';
import 'package:codice/model/partita.dart';
import 'package:codice/model/personaggio.dart';
import 'package:codice/model/stanza.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("stanza esoplorazione", () {
    Stanza stanza = Stanza(
      azioniDisponibili: [
        Azione(
            f1: ({Stanza? s, Personaggio? p}) {}, titoloPulsante: "testAzione")
      ],
      dialogoStanza: [
        {"dialogoTest": true}
      ],
      immagini: ["images/dun.jpg"],
    );
    test("correttezza attributi", () {
      // Controllo che quando l'istanza viene creata il dialogo, le immagini e le azioni disponibili non siano vuote
      expect(stanza.dialogoStanza.length, isNot(0));
      expect(stanza.azioniDisponibili.length, isNot(0));
      expect(stanza.immagini.length, isNot(0));
      expect(stanza.nemico, null);
    });

    // Controllo che il metodo setIndex: aggiunga l'oggetto, aggiunga l'index e che non crei il nemico
    test("setIndex", () {
      stanza.setIndex(4);

      expect(stanza.index, 4);
      expect(stanza.oggettoStanza, isNot(null));
      expect(stanza.nemico, null);
    });

    // Controllo che il metodo increaseDialogoIndex: aggiorni l'index della stanza
    test("setIndex", () {});
  });
}
