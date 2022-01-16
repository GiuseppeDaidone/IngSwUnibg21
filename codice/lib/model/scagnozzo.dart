import 'package:codice/model/nemico.dart';

class Scagnozzo extends Nemico {
  Scagnozzo(
      {required nome,
      required immaginiNemico,
      required livello,
      required disciplina,
      required immagineSfondo,
      required dialogoCombattimento})
      : super(
            nome: nome,
            immagineSfondo: immagineSfondo,
            immaginiNemico: immaginiNemico,
            livello: livello,
            disciplina: disciplina,
            dialogoCombattimento: dialogoCombattimento);

  @override
  void setDannoNemico() {
    if (livello == LivelloNemico.BASSO) {
      danno = 10;
    } else if (livello == LivelloNemico.MEDIO) {
      danno = 20;
    } else {
      danno = 30;
    }
  }
}
