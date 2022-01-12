import 'package:codice/model/azione.dart';
import 'package:codice/model/partita.dart';
import 'package:codice/model/personaggio.dart';
import 'package:codice/model/stanza.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'action_button.dart';

class ActionButtonsRow extends StatefulWidget {
  const ActionButtonsRow(
      {Key? key,
      required this.stanzaCorrente,
      required this.azioniDisponibili,
      required this.partita})
      : super(key: key);

  final Stanza stanzaCorrente;
  final List<Azione> azioniDisponibili;
  final Partita partita;

  @override
  _ActionButtonsRowState createState() => _ActionButtonsRowState();
}

class _ActionButtonsRowState extends State<ActionButtonsRow> {
  @override
  Widget build(BuildContext context) {
    return widget
            .stanzaCorrente
            .dialogoStanza[widget.stanzaCorrente.currentDialogoIndex]
            .values
            .first
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (int i = 0; i < widget.azioniDisponibili.length; i++)
                Expanded(
                  child: ActionButton(
                    nomePulsante: widget.azioniDisponibili[i].titoloPulsante,
                    onPressed: () {
                      widget.azioniDisponibili[i].f1();

                      // Ogni volta che un pulsante risposta viene premuto vado al dialogo successivo
                      widget.stanzaCorrente.increaseDialogoIndex(
                          true, widget.partita,
                          context: context);

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
