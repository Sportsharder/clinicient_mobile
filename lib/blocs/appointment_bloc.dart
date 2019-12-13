import 'package:rxdart/rxdart.dart';
import '../services/appointment_service.dart';
import '../models/export_models.dart';
import 'bloc_provider.dart';
import 'dart:io';
import '../cache/table_appointment.dart';

class AppointmentBloc implements BlocBase {
  final _appointmentService = AppointmentService();

  final _appointmentsRefreshed = PublishSubject<List<Appointment>>();
  Observable<List<Appointment>> get appointmentsRefreshed =>
      _appointmentsRefreshed.stream;

  refreshAppointments(int therapistID) async {
    try {
      List<Appointment> appointments;

      _sinkCache();

      appointments = await _appointmentService.refreshSchedule(therapistID);

      if (appointments != null) {
        await _updateCache(appointments);

        _appointmentsRefreshed.sink.add(appointments);
      }
    } catch (err) {
      print(err);
      _appointmentsRefreshed.sink.addError(err);
    }
  }

  Future<List<Appointment>> _sinkCache() async {
    List<Appointment> appointments;

    try {
      List<Appointment> appointments =
          await TableAppointmentCache.readByTherapist(5);

      if (appointments != null) {
        if (appointments.length != 0) {
          _appointmentsRefreshed.sink.add(appointments);
        }
      }
    } catch (err) {
      print(err);
    }

    return appointments;
  }

  _updateCache(List<Appointment> appointments) async {
    try {
      for (Appointment appointment in appointments) {
        await TableAppointmentCache.upsert(appointment);

/*
        Map<String, dynamic> decode =
        json.decode(circleObjectCache.circleObjectJson);
        */

        //    circleObjectJson: json.encode(circleObject.toJson()).toString(),

      }
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
