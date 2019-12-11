import 'package:rxdart/rxdart.dart';
import '../services/appointment_service.dart';
import '../models/export_models.dart';
import 'bloc_provider.dart';
import 'dart:io';

class AppointmentBloc implements BlocBase {
  static final String CIRCLE_DELETED = 'circle deleted';
  static final String CIRCLE_DELETE_VOTE_CREATED = 'created vote';

  final _appointmentService = AppointmentService();

  final _scheduleLoaded = PublishSubject<bool>();
  Observable<bool> get scheduleLoaded => _scheduleLoaded.stream;

  dispose() async {
    //_movieId.close();
    await _scheduleLoaded.drain();
    _scheduleLoaded.close();
  }
}
