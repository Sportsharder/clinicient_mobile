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

  final _slackingByTimeRefreshed = PublishSubject<List<SlackingByTime>>();
  Observable<List<SlackingByTime>> get slackingByTimeRefreshed =>
      _slackingByTimeRefreshed.stream;

  final _slackingByCountRefreshed = PublishSubject<List<SlackingByCount>>();
  Observable<List<SlackingByCount>> get slackingByCountRefreshed =>
      _slackingByCountRefreshed.stream;

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

  refreshSlackingByTime() async {
    try {
      List<SlackingByTime> slackingByTime =
          await _gamificationService.refreshSlackerBoardByTime();

      if (slackingByTime != null) {
        _slackingByTimeRefreshed.sink.add(slackingByTime);
      }
    } catch (err) {
      print(err);
      _slackingByTimeRefreshed.sink.addError(err);
    }
  }

  refreshSlackingByCount() async {
    try {
      List<SlackingByCount> slackingByCount =
      await _gamificationService.refreshSlackerBoardByCount();

      if (slackingByCount != null) {
        _slackingByCountRefreshed.sink.add(slackingByCount);
      }
    } catch (err) {
      print(err);
      _slackingByCountRefreshed.sink.addError(err);
    }
  }


  dispose() async {
    await _signOffLeaderboardRefreshed.drain();
    _signOffLeaderboardRefreshed.close();

    await _slackingByTimeRefreshed.drain();
    _slackingByTimeRefreshed.close();

    await _slackingByCountRefreshed.drain();
    _slackingByCountRefreshed.close();
  }
}
