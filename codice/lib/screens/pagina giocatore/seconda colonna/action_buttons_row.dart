import 'package:codice/model/azione.dart';
import 'package:codice/model/partita.dart';
import 'package:codice/model/stanza.dart';
import 'package:flutter/material.dart';
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
    return Container(
      color: Colors.red,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            // Lista Pulsanti
            child:
                // mostro i pulsanti per le azioni solamente quando serve
                widget
                        .stanzaCorrente
                        .dialogoStanza[
                            widget.stanzaCorrente.currentDialogoIndex]
                        .values
                        .first
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.azioniDisponibili.length,
                        itemBuilder: (context, index) {
                          return widget.azioniDisponibili.isNotEmpty
                              ? ActionButton(
                                  nomePulsante: widget
                                      .azioniDisponibili[index].titoloPulsante,
                                  onPressed: () {
                                    widget.azioniDisponibili[index].f1();

                                    // Ogni volta che un pulsante risposta viene premuto vado al dialogo successivo
                                    widget.stanzaCorrente.increaseDialogoIndex(
                                        true, widget.partita, context);

                                    // Aggiorno la pagina
                                    widget.partita.updateState();
                                  },
                                )
                              : const SizedBox(
                                  height: 30,
                                  width: 20,
                                );
                        },
                      )
                    : const SizedBox(),
          )
        ],
      ),
    );
  }
}
