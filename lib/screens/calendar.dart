import 'package:flutter/material.dart';
import '../widgets/export_widgets.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'patientdetail.dart';
import '../blocs/appointment_bloc.dart';
import '../models/export_models.dart';
import 'package:intl/intl.dart';

/*
class Appointment {
  final String patientName;

  Appointment({this.patientName});
}
*/

class Calendar extends StatefulWidget {
  Calendar({Key key}) : super(key: key);

  String title = "timelyPT";

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  var _currentDate; // = DateTime.now().toLocal();
  var _markedDateMap;
  var _selectedDate;

  ScrollController _scrollController = new ScrollController();
  AppointmentBloc _appointmentBloc = AppointmentBloc();
  List<Appointment> _appointments = List();
  List<Appointment> _filteredAppointments = List();

  @override
  void initState() {
    super.initState();

    if (globalState.lastSelectedDate == null) {
      _currentDate = DateTime.now().toLocal();
    } else {
      _currentDate = globalState.lastSelectedDate;
    }

    _appointmentBloc.appointmentsRefreshed.listen((appointments) {
      if (mounted) {
        _appointments = List();
        _filteredAppointments = List();

        _appointments.addAll(appointments);
        _filteredAppointments.addAll(appointments);

        setState(() {
          _filteredAppointments.retainWhere((appointment) =>
              appointment.startDate
                  .compareTo(DateFormat.yMMMd().format(_currentDate)) ==
              0);
        });
      }
    }, onError: (err) {
      print("error $err");
    }, cancelOnError: false);

    _appointmentBloc.refreshAppointments(globalState.therapist.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        // drawer: CustomDrawer(),
        appBar: ClappBarr(
          title: widget.title,
          showHome: false,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /*Text(
                'Clinic',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),*/
              Container(
                //  margin: EdgeInsets.all(10),
                child: CalendarCarousel<Event>(
                  headerMargin: EdgeInsets.only(),
                  weekDayMargin: EdgeInsets.only(top: 0, bottom: 0),
                  //viewportFraction: .1,
                  onDayPressed: (DateTime date, List<Event> events) {
                    _dateChange(date, events);
                    //this.setState(() => {_currentDate = date});
                  },
                  weekendTextStyle: TextStyle(
                      color: Color(0xffE202E4A)
                  ),
                  thisMonthDayBorderColor: Color(0xffE202E4A),
                  selectedDayButtonColor: Color(0xffE202E4A),
                  todayButtonColor: Colors.grey,
                  headerTextStyle: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                  weekdayTextStyle: TextStyle(
                      color: Color(0xffE202E4A),
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                  iconColor: Color(0xffE202E4A),
                  dayPadding: 1,
                  customDayBuilder: (
                      /// you can provide your own build function to make custom day containers
                      bool isSelectable,
                      int index,
                      bool isSelectedDay,
                    bool isToday,
                    bool isPrevMonthDay,
                    TextStyle textStyle,
                    bool isNextMonthDay,
                    bool isThisMonthDay,
                    DateTime day,
                  ) {
                    /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
                    /// This way you can build custom containers for specific days only, leaving rest as default.

                    /*
                    // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
                    if (day.day == 15) {
                      return Center(
                        child: Icon(Icons.wb_sunny),
                      );
                    } else {
                      return null;
                    }
                    */

                    return null;
                  },
                  weekFormat: false,
                  weekDayPadding: EdgeInsets.only(),
                  markedDatesMap: _markedDateMap,
                  height: 350.0,
                  selectedDateTime: _currentDate,
                  daysHaveCircularBorder: null,

                  /// null for not rendering any border, true for circular border, false for rectangular border
                ),
              ),
              _filteredAppointments.length == 0
                  ? Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                "You're free!",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              ))
                        ]))
                  : Expanded(
                      //height: 100,
                      //width: 200,
                      child: SingleChildScrollView(
                        child: Container(
                            // color: Colors.black,
                            // padding: const EdgeInsets.only(
                            //     left: 0, right: 0),
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                controller: _scrollController,
                                shrinkWrap: true,
                                itemCount: _filteredAppointments.length,
                                itemBuilder: (BuildContext context, int index) {

                                  if (index < 1) return Container();

                                  Color color;

                                  if (index.isEven) {
                                    color = Colors.white30;
                                  } else {
                                    color = Colors.white70;
                                  }

                                  Appointment currentRow =
                                      _filteredAppointments[index];

                                  return Center(
                                      child: Card(
                                          color: color,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  top: 10,
                                                  bottom: 10),
                                              child: InkWell(
                                                  onTap: () =>
                                                      _openPatientDetail(
                                                          currentRow),
                                                  child:
                                                      Column(children: <Widget>[
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: <Widget>[
                                                          Text(
                                                              currentRow
                                                                  .startTime,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      18)),
                                                          Spacer(flex: 1),
                                                          Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                  child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                    Text(
                                                                        currentRow.patientFirstName !=
                                                                                null
                                                                            ? currentRow
                                                                                .patientFirstName
                                                                            : '',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                        )),
                                                                    Text(' ',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                        )),
                                                                    Text(
                                                                        currentRow.patientLastName !=
                                                                                null
                                                                            ? currentRow
                                                                                .patientLastName
                                                                            : '',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16)),
                                                                  ]))),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 15,
                                                                    top: 15),
                                                          )
                                                        ]),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: <Widget>[
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 20),
                                                              child: Text(
                                                                  currentRow.duration !=
                                                                          null
                                                                      ? currentRow
                                                                              .duration
                                                                              .toString() +
                                                                          ' minutes'
                                                                      : '',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18))),
                                                          Spacer(flex: 1),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            15),
                                                                child: Text(
                                                                    currentRow.appointmentType !=
                                                                            null
                                                                        ? currentRow
                                                                            .appointmentType
                                                                        : '',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16))),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 15,
                                                                    top: 15),
                                                          )
                                                        ])
                                                  ])))));
                                })),
                      ),
                    ),
            ]));
  }

  _dateChange(DateTime date, List<Event> events) {
    _filteredAppointments = List();

    _filteredAppointments.addAll(_appointments);

    setState(() {
      _currentDate = date;
      globalState.lastSelectedDate = date;
      _filteredAppointments.retainWhere((appointment) =>
          appointment.startDate
              .compareTo(DateFormat.yMMMd().format(_currentDate)) ==
          0);

      print(_filteredAppointments.length);
      print(_filteredAppointments.length);

    });
  }

  _openPatientDetail(Appointment appointment) {
    globalState.lastSelectedDate = _currentDate;

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => PatientDetail(
                  appointment,
                )),
        ModalRoute.withName("/home"));
  }
}
