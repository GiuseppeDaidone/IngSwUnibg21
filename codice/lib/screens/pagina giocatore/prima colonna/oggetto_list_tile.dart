import 'package:codice/utils/facade.dart';

class OggettoListTile extends StatelessWidget {
  const OggettoListTile({
    Key? key,
    required this.oggetto,
  }) : super(key: key);

  final Oggetto oggetto;

  void checkOggetto(context, personaggio, partita, stanza) {
    // AMULETO
    if (oggetto is Amuleto) {
      oggetto.usa(personaggio, oggetto, stanza);
      Navigator.pop(context);
    }
    // ARCO
    else if (oggetto is Arco) {
      if (stanza.nemico != null && stanza.nemico!.statoNemico == StatoNemico.DOMANDA) {
        oggetto.usa(personaggio, oggetto, stanza);
        partita.updateState();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Puoi usare questo oggetto solamente durante una domanda",
            ),
          ),
        );
      }
      Navigator.pop(context);
    } else {
      oggetto.usa(personaggio, oggetto, stanza);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<Partita, Personaggio>(builder: (context, partita, personaggio, _) {
      return GestureDetector(
        // Gestisco logica per quando un item viene cliccato
        onTap: () => checkOggetto(context, personaggio, partita, partita.getStanzaCorrente()),
        child: Card(
          elevation: 3,
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: GameTheme.buttonColor,
            ),
            child: Center(
              child: Row(
                children: [
                  // ICONA OGGETTO
                  Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    height: 20,
                    child: Image.asset(oggetto.icon),
                  ),

                  const SizedBox(width: 30),

                  // NOME OGGETTO
                  Text(oggetto.name)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
