import 'package:rxdart/rxdart.dart';
import '../services/appointment_service.dart';
import '../models/export_models.dart';
import 'bloc_provider.dart';
import 'dart:io';

class AppointmentBloc implements BlocBase {
  final _appointmentService = AppointmentService();

  final _appointmentsRefreshed = PublishSubject<bool>();
  Observable<bool> get appointmentsRefreshed => _appointmentsRefreshed.stream;

  refreshAppointments(int therapistID) {
    try {
      _appointmentService.refreshSchedule(therapistID);
    } catch (err) {
      print(err);
    }
  }

  dispose() async {
    //_movieId.close();
    await _appointmentsRefreshed.drain();
    _appointmentsRefreshed.close();
  }
}
