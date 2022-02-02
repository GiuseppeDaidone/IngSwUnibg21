import 'package:codice/model/partita_stats.dart';
import 'package:get_it/get_it.dart';

class PartitaStatsLocator {
  void setup() {
    GetIt.I.registerSingleton<PartitaStats>(PartitaStats());
  }
}
