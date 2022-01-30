import 'package:codice/database/oggettiDB.dart';
import 'package:codice/model/azione.dart';
import 'package:codice/model/esplorazione.dart';
import 'package:codice/model/personaggio.dart';
import 'package:codice/model/stanza.dart';

// NB: nel dialogo esplorazione metto true quando voglio cambiare immagine e mostrare un'azione all'utente
class EsplorazioneDB {
  /* Esplorazione getEsplorazione() {
    return listaEsplorazioni[Random().nextInt(listaEsplorazioni.length)];
  } */

  List<Esplorazione> listaEsplorazioni = [
    // Stanza 1
    Esplorazione(
      azioniDisponibili: [
        // AZIONE 1
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            p!.addOggetto(OggettiDB().getOggetto());
            return;
          },
          titoloPulsante: "Arrampicati e prendilo",
        ),

        // AZIONE 2
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            return;
          },
          titoloPulsante: "Lascia l'oggetto al suo posto",
        ),
      ],
      dialogoEsplorazione: [
        {
          "Entri in una stanza molto disordinata, con libri ed ampolle sparsa dappertutto":
              false
        },
        {
          "Ti metti allora a frugare tra i libri per vedere di cosa trattano":
              false
        },
        {
          "Ti avvicini ad uno scaffale e devi che in cima è presente un oggetto luccicante, cosa vuoi fare?":
              true
        },
      ],
      immaginiSfondo: ["images/s1.jpg", "images/s1.jpg"],
    ),

    // Stanza 2
    Esplorazione(
      azioniDisponibili: [
        // AZIONE 1
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            return;
          },
          titoloPulsante: "Procedi alla prossima stanza",
        ),
      ],
      dialogoEsplorazione: [
        {
          "Entri in un locale che sembra essere una stanza da letto di qualche artista musicale":
              false
        },
        {"Non sembra esserci nulla di interessante da raccogliere": true},
      ],
      immaginiSfondo: ["images/s2.jpg", "images/s2.jpg"],
    ),

    // Stanza 3
    Esplorazione(
      azioniDisponibili: [
        // AZIONE 1
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            p!.decrSalute(5);
            p.addOggetto(OggettiDB().getOggetto());
            return;
          },
          titoloPulsante: "Provi a prendere l'oggetto scottandoti",
        ),

        // AZIONE 2
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            return;
          },
          titoloPulsante: "Lasci l'oggetto al suo posto",
        ),

        // AZIONE 3
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            p!.decrSalute(10);
            return;
          },
          titoloPulsante: "Tiri un calcio alla fornace",
        )
      ],
      dialogoEsplorazione: [
        {
          "Entri in una piccola stanza dall'aspetto molto cozy. Ti metti a frugare tra gli oggetti presenti ":
              false
        },
        {
          "Vedi che dentro la fornace sembra esserci qualcosa di utile, cosa vuoi fare?":
              true
        },
      ],
      immaginiSfondo: ["images/s3.jpg", "images/s3.jpg"],
    ),

    // Stanza 4
    Esplorazione(
      azioniDisponibili: [
        // AZIONE 1
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            return;
          },
          titoloPulsante: "Vai alla stanza successiva",
        ),
      ],
      dialogoEsplorazione: [
        {"Entri in una stanza piena di libri e molto illuminata": false},
        {
          "Provi a rovistare tra le pergamene e le pile di libri ma non trovi nulla di utile":
              true
        },
      ],
      immaginiSfondo: ["images/s4.jpg", "images/s4.jpg"],
    ),

    // Stanza 5
    Esplorazione(
      azioniDisponibili: [
        // AZIONE 1
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            p!.decrSalute(9);
            p.addOggetto(OggettiDB().getOggetto());
            return;
          },
          titoloPulsante: "Provi a prendere l'oggetto pungendoti",
        ),

        // AZIONE 2
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            return;
          },
          titoloPulsante: "Lasci l'oggetto al suo posto",
        ),

        // AZIONE 3
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            p!.addOggetto(OggettiDB().getOggetto());
            return;
          },
          titoloPulsante: "Provi a fare un'acrobazia...",
        )
      ],
      dialogoEsplorazione: [
        {
          "Entri una stanza che da l'impressione sia sott'acqua, i coralli, le sfumature blu ed il profumo di brezza marina ti investono":
              false
        },
        {"Ti avvicini ai coralli in fondo alla stanza": false},
        {
          "Vedi un oggetto incastrato nei coralli, che però sono ricoperti di grosse spine violacee. Cosa vuoi fare?":
              true
        }
      ],
      immaginiSfondo: ["images/s5.jpg", "images/s5.jpg"],
    ),
  ];
}
