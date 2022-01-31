import 'package:codice/model/personaggio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test Personaggio", () {
    test("controllo che la salute iniziale sia 100", () {
      Personaggio p = Personaggio(nome: "bob");
      expect(p.getSalute(), 100);
    });

    test("controllo che il nome giocatore sia impostato correttamente", () {
      Personaggio p = Personaggio(nome: "bob");
      expect(p.nome, "bob");
    });

    test("controllo che la salute non vada oltre il 100", () {
      Personaggio p = Personaggio(nome: "bob");
      p.incrSalute(40);

      expect(p.getSalute(), 100);
    });

    test("Controllo che decrSalute funzioni", () {
      Personaggio p = Personaggio(nome: "bob");
      p.decrSalute(40);

      expect(p.getSalute(), 60);
    });

    test(
        "controllo che disequipaggia oggetto fuzione anche se non ho un oggetto equipaggiato",
        () {
      Personaggio p = Personaggio(nome: "bob");
      p.disequipaggiaOggetto();

      expect(p.oggettoEquipaggiato, null);
    });
  });
}
