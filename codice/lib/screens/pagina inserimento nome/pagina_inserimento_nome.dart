import 'package:codice/screens/pagina%20giocatore/pagina_giocatore.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
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
                  const Text(
                    "Inserisci il tuo nickname",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),

                  // TEXTFIELD NICKNAME
                  Container(
                    height: 90,
                    width: 350,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(top: 50),
                    child: TextField(
                      controller: _editingController,
                      focusNode: _focusNode,
                      maxLength: 20,
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
                                  return const PaginaGiocatore();
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
                    child: const Text("Inizia la Partita"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
