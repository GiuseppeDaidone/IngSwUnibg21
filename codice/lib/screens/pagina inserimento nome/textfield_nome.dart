import 'package:codice/model/partita.dart';
import 'package:codice/model/personaggio.dart';
import 'package:codice/screens/pagina%20giocatore/pagina_giocatore.dart';
import 'package:codice/theme/game_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldNome extends StatefulWidget {
  const TextFieldNome({Key? key}) : super(key: key);

  @override
  State<TextFieldNome> createState() => _TextFieldNomeState();
}

class _TextFieldNomeState extends State<TextFieldNome> {
  late FocusNode _focusNode;
  late TextEditingController _editingController;

  @override
  void initState() {
    _focusNode = FocusNode();
    // Quando l'utente modifica la textfield resfresho la pagina
    _focusNode.addListener(() {
      setState(() {});
    });

    _editingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _editingController.dispose();
    super.dispose();
  }

  // Metodo chiamato per andare alla pagina giocatore
  void changePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MultiProvider(
            providers: [
              // Provider partita
              ChangeNotifierProvider<Partita>(
                lazy: false,
                create: (_) => Partita(),
              ),

              // Provider personaggio
              ChangeNotifierProvider<Personaggio>(
                lazy: false,
                create: (_) => Personaggio(nome: _editingController.text),
              )
            ],
            builder: (context, personaggio) {
              return const PaginaGiocatore();
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          width: 350,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(top: 50),
          child: TextField(
            focusNode: _focusNode,
            controller: _editingController,
            // quando scrivo nuovi caratteri
            onChanged: (text) {
              setState(() {});
            },
            // quando premo pulsante invio
            onSubmitted: (text) {
              if (text != "") {
                changePage();
              }
            },
            maxLength: 15,
            textAlign: TextAlign.center,
            style: const TextStyle(
              //Colore testo
              color: Colors.white,
              fontSize: 30,
            ),
            // Colore cursore
            cursorColor: Colors.green[300],
            cursorHeight: 30,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  // Colore bordi
                  color: Colors.green[800]!,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              hintText: _focusNode.hasFocus ? "" : "UMLWizard69",
              hintStyle: const TextStyle(
                // Colore HintText
                color: Colors.grey,
                fontSize: 30,
              ),
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        ),

        // PULSANTE INIZIA PARTITA
        ElevatedButton(
          onPressed: _editingController.text == ""
              ? null
              : () {
                  changePage();
                },
          style: ElevatedButton.styleFrom(
            primary: Colors.green[800],
            minimumSize: const Size(200, 50),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
          child: Text(
            "Inizia la Partita",
            style: GameFonts().hallelujaFont(),
          ),
        )
      ],
    );
  }
}
