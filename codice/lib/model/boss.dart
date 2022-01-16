import 'package:codice/model/nemico.dart';

class Boss extends Nemico {
  Boss(
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
      danno = 50;
    } else if (livello == LivelloNemico.MEDIO) {
      danno = 60;
    } else {
      danno = 70;
    }
  }
}
