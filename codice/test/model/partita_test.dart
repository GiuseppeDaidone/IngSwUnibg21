// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:codice/model/partita.dart';
import 'package:codice/model/stanza.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("partita", () {
    // Controllo che la mappa abbia la giusta lunghezza
    test("lunghezza mappa", () {
      Partita partita = Partita();

      List<Stanza> mappa = partita.mappa;

      expect(mappa.length, 10);
    });

    // Controllo che il metodo getStanzaCorrente non ritorni un null
    test("getStanzaCorrente", () {
      Partita partita = Partita();

      Stanza stanza = partita.getStanzaCorrente();

      expect(stanza, isNot(null));
    });

    // Controllo che il metodo goStanzaSuccessiva aumenti il counter sia in stanza che in partita
    test("goNextStanza", () {
      Partita partita = Partita();

      partita.goStanzaSuccessiva();
      int indexNuovaStanza = partita.getStanzaCorrente().index;
      int nuovoIndex = partita.getIndexStanzaCorrente();

      expect(indexNuovaStanza, 1);
      expect(nuovoIndex, 1);
    });
  });
}
