import 'package:codice/model/partita_stats.dart';
import 'package:codice/theme/game_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BoxStatistiche extends StatelessWidget {
  BoxStatistiche({Key? key}) : super(key: key);

  final PartitaStats pstats = GetIt.instance<PartitaStats>();

  @override
  Widget build(context) {
    return Expanded(
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.only(right: 100, left: 100),
        color: Colors.green[800],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // DESCRIZIONE BOX STATISTICHE
              Text(
                "Statistiche Partita",
                textAlign: TextAlign.start,
                style: GameFonts().hallelujaFont(size: 30),
              ),

              const SizedBox(
                height: 50,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      // Tempo Impiegato
                      Text("Tempo Impiegato: "),

                      // Domande Sbagliate
                      Text("Domande Sbagliate:"),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // Tempo Impiegato
                      Text(
                        DateTime.now()
                            .difference(
                              pstats.getIstanteInizioPartita(),
                            )
                            .toString()
                            .substring(0, 11),
                      ),

                      // Domande Sbagliate
                      Text(pstats.getDomandeSbagliate().toString()),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text("Domande Totali:"),

                      // Oggetti Utilizzati
                      Text("Oggetti Utilizzati:"),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(pstats.getDomandeRisposte().toString()),

                      // Oggetti Utilizzati
                      Text(
                        pstats.getOggettiUtilizzati().toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
