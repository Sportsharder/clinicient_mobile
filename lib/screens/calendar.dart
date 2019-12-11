import 'package:flutter/material.dart';
import '../widgets/export_widgets.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

class Appointment {
  final String patientName;

  Appointment({this.patientName});
}

class Calendar extends StatefulWidget {
  Calendar({Key key}) : super(key: key);

  String title = "Insight Mobile Calendar";

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  var _currentDate;
  var _markedDateMap;
  ScrollController _scrollController = new ScrollController();


  List<Appointment> _appointments = [
    Appointment(patientName: "Melinda"),
    Appointment(patientName: "Kelsey"),
    Appointment(patientName: "Serhat"),
    Appointment(patientName: "Joel"),
    Appointment(patientName: "Jeremy"),
    Appointment(patientName: "Someone1"),
    Appointment(patientName: "Someone2"),
    Appointment(patientName: "Someone3"),
    Appointment(patientName: "Someone4"),
    Appointment(patientName: "Someone5"),
    Appointment(patientName: "Someone6"),
    Appointment(patientName: "Someone7"),
    Appointment(patientName: "Someone8"),
    Appointment(patientName: "Someone9"),
    Appointment(patientName: "Someone10"),
    Appointment(patientName: "Someone11"),
    Appointment(patientName: "Someone12"),
  ]; //, "Kelsey", "Serhat", "Joel,", "Jeremy"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: TapBar(
          title: widget.title,
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
                  weekDayMargin: EdgeInsets.only(top:0, bottom:0),

                  //viewportFraction: .1,

                  onDayPressed: (DateTime date, List<Event> events) {
                    this.setState(() => _currentDate = date);
                  },
                  weekendTextStyle: TextStyle(
                    color: Colors.teal,
                  ),
                  thisMonthDayBorderColor: Colors.grey,
                  todayButtonColor: Colors.teal,
                  headerTextStyle: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                  weekdayTextStyle: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                  iconColor: Colors.teal,
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
              Expanded(
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
                          itemCount: _appointments.length,
                          itemBuilder: (BuildContext context, int index) {
                            Appointment currentRow = _appointments[index];

                            return Row(children: <Widget>[
                              Text(currentRow.patientName)
                            ]);
                          })),
                ),
              ),
            ]));
  }
}
