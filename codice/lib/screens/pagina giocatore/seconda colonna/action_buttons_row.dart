import 'package:codice/model/azione.dart';
import 'action_button.dart';
import 'package:codice/utils/facade.dart';

class ActionButtonsRow extends StatefulWidget {
  const ActionButtonsRow({Key? key, required this.stanzaCorrente, required this.azioniDisponibili, required this.partita}) : super(key: key);

  final Stanza stanzaCorrente;
  final List<Azione> azioniDisponibili;
  final Partita partita;

  @override
  _ActionButtonsRowState createState() => _ActionButtonsRowState();
}

class _ActionButtonsRowState extends State<ActionButtonsRow> {
  @override
  Widget build(BuildContext context) {
    bool flag = false;
    if (widget.stanzaCorrente.nemico == null) {
      if (widget.stanzaCorrente.esplorazione!.statoEsplorazione == StatoEsplorazione.AZIONE) {
        flag = true;
      }
    } else {
      if (widget.stanzaCorrente.nemico!.statoNemico == StatoNemico.DOMANDA) {
        flag = true;
      }
    }
    return flag
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (int i = 0; i < widget.azioniDisponibili.length; i++)
                Expanded(
                  child: ActionButton(
                    nomePulsante: widget.azioniDisponibili[i].titoloPulsante,
                    onPressed: () {
                      widget.azioniDisponibili[i].f1(
                        s: widget.stanzaCorrente,
                        p: Provider.of<Personaggio>(context, listen: false),
                      );

                      // Ogni volta che un pulsante risposta viene premuto vado al dialogo successivo
                      widget.stanzaCorrente.increaseDialogoIndex(
                        true,
                        widget.partita,
                      );

                      // Aggiorno la pagina
                      widget.partita.updateState();
                    },
                  ),
                )
            ],
          )
        : const SizedBox();
  }
}
