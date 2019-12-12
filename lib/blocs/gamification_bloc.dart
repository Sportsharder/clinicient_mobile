import 'package:rxdart/rxdart.dart';
import '../services/gamification_service.dart';
import '../models/export_models.dart';
import 'bloc_provider.dart';
import 'dart:io';

class GamificationBloc implements BlocBase {
  final _gamificationService = GamificationService();

  final _signOffLeaderboardRefreshed = PublishSubject<List<SignedVisit>>();
  Observable<List<SignedVisit>> get signoffLeaderboardRefreshed =>
      _signOffLeaderboardRefreshed.stream;

  refreshSignoffLeaderboard(String filter) async {
    try {
      List<SignedVisit> signedVisits =
          await _gamificationService.refreshSignoffLeaderboard(filter);

      if (signedVisits != null) {
        _signOffLeaderboardRefreshed.sink.add(signedVisits);
      }
    } catch (err) {
      print(err);
      _signOffLeaderboardRefreshed.sink.addError(err);
    }
  }

  dispose() async {
    //_movieId.close();
    await _signOffLeaderboardRefreshed.drain();
    _signOffLeaderboardRefreshed.close();
  }
}
