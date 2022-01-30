import 'dart:math';

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
          "Entri in una stanza che da l'impressione sia sott'acqua, i coralli, le sfumature blu ed il profumo di brezza marina ti investono":
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

    // Stanza 6
    Esplorazione(
      azioniDisponibili: [
        // AZIONE 1
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            if (Random().nextInt(2) == 0) {
              p!.addOggetto(OggettiDB().getOggetto());
            }
            return;
          },
          titoloPulsante:
              "Provi a cercare la combinazione (50% prob. di successo)",
        ),

        // AZIONE 2
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            p!.decrSalute(5);
            return;
          },
          titoloPulsante: "Tiri un pugno alla serratura",
        ),

        // AZIONE 3
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            return;
          },
          titoloPulsante: "Rimetti a posto il quadro e te ne vai",
        )
      ],
      dialogoEsplorazione: [
        {
          "Entri in una stanza dall'aspetto antiquato, gran parte della mobilia è in legno ed è ricoperta da un leggero strato di polvere":
              false
        },
        {
          "Ti siedi sul divano e ti messi ad osservare i quadri appesi sopra il camino, noti che uno di essi è storto":
              false
        },
        {
          "Ti avvicini, provi a spostare il quadro e vedi che dietro è prensente una cassaforte, cosa vuoi fare?":
              true
        }
      ],
      immaginiSfondo: ["images/s6.jpg", "images/s6.jpg"],
    ),

    // Stanza 7
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
          "Entri in una stanza e sei immediatamente spaventato da quello che vedi. Animali imbalsamati, pezzi di arti dentro dei vasi e ampolle contenenti liquidi di ogni tipo":
              false
        },
        {
          "Dai un occhiata al libro sul tavolo, ma le scritte sono incomprensibili, fai allora un giro della stanza":
              false
        },
        {
          "Vedi un grosso serpente stringere un oggetto brillante tra le sue squame, Cosa vuoi fare?":
              true
        }
      ],
      immaginiSfondo: ["images/s7.jpg", "images/s7.jpg"],
    ),

    // Stanza 8
    Esplorazione(
      azioniDisponibili: [
        // AZIONE 1
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            p!.decrSalute(7);
            return;
          },
          titoloPulsante:
              "Fuggi dall'impianto di ventilazione ferendoti una gamba",
        ),

        // AZIONE 2
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            p!.decrSalute(15);
            return;
          },
          titoloPulsante: "Affronti il mostro",
        ),

        // AZIONE 3
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            p!.incrSalute(10);
            return;
          },
          titoloPulsante: "Chiedi al mostro la direzione per l'uscita...",
        )
      ],
      dialogoEsplorazione: [
        {
          "Questa stanza è completamente diversa dalle altre, non ha nulla di accogliente e l'odore è terribile":
              false
        },
        {
          "Cerchi di muoverti evitando il sangue per terra e sui mobiletti":
              false
        },
        {
          "Ad un certo punto senti un ruggito provenire dal fondo del corridoio, ti sporgi e vedi una creatura senza testa correre verso la tua stanza. Cosa fai?":
              true
        }
      ],
      immaginiSfondo: ["images/s8.jpg", "images/s8.jpg"],
    ),

    // Stanza 9
    Esplorazione(
      azioniDisponibili: [
        // AZIONE 1
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            p!.addOggetto(OggettiDB().getOggetto());
            return;
          },
          titoloPulsante: "Si",
        ),

        // AZIONE 2
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            p!.addOggetto(OggettiDB().getOggetto());
            return;
          },
          titoloPulsante: "No",
        ),
      ],
      dialogoEsplorazione: [
        {
          "Entri in una stanza con il camino acceso da cui proviene un leggero tepore ed un odore di bosco":
              false
        },
        {
          "Ti siedi sul divanetto, sposti la coperta e sotto trovi un oggetto, decidi di raccoglierlo":
              false
        },
        {
          "Sei molto stanco, vuoi dormire prima di continuare con il viaggio ?":
              true
        }
      ],
      immaginiSfondo: ["images/s9.jpg", "images/s9.jpg"],
    ),

    // Stanza 10
    Esplorazione(
      azioniDisponibili: [
        // AZIONE 1
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            p!.decrSalute(20);
            p.addOggetto(OggettiDB().getOggetto());
            return;
          },
          titoloPulsante: "Prendi l'oggetto cadendo e rompendoti un braccio",
        ),

        // AZIONE 2
        Azione(
            f1: ({Stanza? s, Personaggio? p}) {
              return;
            },
            titoloPulsante: "Richiudi la botola e te ne vai"),

        // AZIONE 3
        Azione(
          f1: ({Stanza? s, Personaggio? p}) {
            return;
          },
          titoloPulsante: "Lanci un sassolino nella botola",
        )
      ],
      dialogoEsplorazione: [
        {
          "Entri in una stanza che sembra essere dimora di un inventore. Strumenti da disegno e laboratorio ricoprono i tavoli":
              false
        },
        {
          "Cercando di non far caso alle creature immerse negli acquari, noti una botola al centro della stanza, provi ad aprirla":
              false
        },
        {
          "Non vedi il fondo, ma vedi un riflesso di un oggetto sul fondo del buco. Cosa vuoi fare?":
              true
        }
      ],
      immaginiSfondo: ["images/s10.jpg", "images/s10.jpg"],
    ),
  ];
}
