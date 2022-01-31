import 'package:codice/functions/creazione_partita.dart';
import 'package:codice/model/domanda.dart';
import 'package:codice/model/nemico.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test funzioni creazione partita", () {
    test("controllo che creaDomandeNemico mi restituisca 3 domande", () {
      var c = CreazionePartita()
          .creaDomandeNemico(LivelloNemico.ALTO, Disciplina.DATABASE);

      expect(c.length, 3);
    });

    test("controllo che le domande create siano del livello giusto", () {
      var c = CreazionePartita()
          .creaDomandeNemico(LivelloNemico.ALTO, Disciplina.DATABASE);

      expect(c[0].difficolta, Difficolta.DIFFICILE);
      expect(c[1].difficolta, Difficolta.DIFFICILE);
      expect(c[2].difficolta, Difficolta.DIFFICILE);
    });

    test("controllo che le domande create siano della giusta disciplina", () {
      var c = CreazionePartita()
          .creaDomandeNemico(LivelloNemico.MEDIO, Disciplina.RETI);

      expect(c[0].disciplina, Disciplina.RETI);
      expect(c[1].disciplina, Disciplina.RETI);
      expect(c[2].disciplina, Disciplina.RETI);
    });

    test("controllo che creaNemico crei il nemico giusto in base all'index",
        () {
      var cp = CreazionePartita();
      var n1 = cp.creaNemico(1);
      var n2 = cp.creaNemico(5);
      var n3 = cp.creaNemico(8);

      expect(n1.livello, LivelloNemico.BASSO);
      expect(n2.livello, LivelloNemico.MEDIO);
      expect(n3.livello, LivelloNemico.ALTO);
    });
  });

  test("controllo che tutte le stanze della mappa siano diverse tra loro", () {
    var ma = CreazionePartita().creaMappa();

    for (int i = 0; i < ma.length; i++) {
      for (int j = 0; j < ma.length && j != i; j++) {
        expect(ma[i], isNot(ma[j]));
      }
    }
  });
}
