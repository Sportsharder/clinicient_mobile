import 'package:rxdart/rxdart.dart';
import '../services/appointment_service.dart';
import '../models/export_models.dart';
import 'bloc_provider.dart';
import 'dart:io';

class AppointmentBloc implements BlocBase {
  final _appointmentService = AppointmentService();

  final _appointmentsRefreshed = PublishSubject<List<Appointment>>();
  Observable<List<Appointment>> get appointmentsRefreshed =>
      _appointmentsRefreshed.stream;

  refreshAppointments(int therapistID) async {
    try {
      List<Appointment> appointments =
          await _appointmentService.refreshSchedule(therapistID);

      if (appointments != null) {
        _appointmentsRefreshed.sink.add(appointments);
      }
    } catch (err) {
      print(err);
      _appointmentsRefreshed.sink.addError(err);
    }
  }

  dispose() async {
    //_movieId.close();
    await _appointmentsRefreshed.drain();
    _appointmentsRefreshed.close();
  }
}
