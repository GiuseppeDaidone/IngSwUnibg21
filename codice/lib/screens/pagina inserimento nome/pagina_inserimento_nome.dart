import 'package:codice/model/Personaggio.dart';
import 'package:codice/model/partita.dart';
import 'package:codice/screens/pagina%20giocatore/pagina_giocatore.dart';
import 'package:codice/theme/game_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// [PAG2]

class PaginaInserimentoNome extends StatefulWidget {
  const PaginaInserimentoNome({Key? key}) : super(key: key);

  @override
  State<PaginaInserimentoNome> createState() => _PaginaInserimentoNomeState();
}

class _PaginaInserimentoNomeState extends State<PaginaInserimentoNome> {
  late FocusNode _focusNode;
  late TextEditingController _editingController;

  @override
  void initState() {
    _focusNode = FocusNode();
    // Quando l'uente clicca sulla textfield resfresho la pagina
    _focusNode.addListener(() {
      setState(() {});
    });

    _editingController = TextEditingController();
    super.initState();
  }

  // Libero la memoria
  @override
  void dispose() {
    _focusNode.dispose();
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Immagine sfondo
          SizedBox(
            height: size.height,
            width: size.width,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Center(
                child: Image.asset("images/homegif.gif"),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // TITLE
                Text(
                  "Inserisci il tuo nickname",
                  style: GameFonts().hallelujaFont(size: 40),
                ),

                // TEXTFIELD NICKNAME
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const PaginaGiocatore();
                            },
                          ),
                        );
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

                const SizedBox(
                  height: 10,
                ),

                // PULSANTE INIZIA PARTITA
                ElevatedButton(
                  onPressed: _editingController.text == ""
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MultiProvider(
                                  providers: [
                                    // Partita Provider
                                    ChangeNotifierProvider<Partita>(
                                      create: (_) => Partita(),
                                    ),

                                    // Personaggio Provider
                                    ChangeNotifierProvider<Personaggio>(
                                      create: (_) => Personaggio(
                                          nome: _editingController.text),
                                    ),
                                  ],
                                  child: const PaginaGiocatore(),
                                );
                              },
                            ),
                          );
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
            ),
          )
        ],
      ),
    );
  }
}
