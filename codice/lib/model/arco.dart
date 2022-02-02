import 'package:codice/utils/facade.dart';

class Arco extends Oggetto {
  Arco({required String name})
      : super(
          name: name,
          icon: "images/arcoIcon.png",
        );

  @override
  void usa(Personaggio personaggio, Oggetto oggetto, Stanza stanza) {
    List<Domanda> listaDomande = DomandeDB().listaDomande.where((element) => element.disciplina == stanza.nemico!.disciplina).toList();
    Domanda newDomanda = listaDomande[Random().nextInt(listaDomande.length)];
    stanza.azioniDisponibili.clear();
    stanza.nemico!.creazioneAzioni(newDomanda);
    stanza.dialogoCorrente = newDomanda.testoDomanda;
    personaggio.eliminaOggetto(oggetto);
  }
}
