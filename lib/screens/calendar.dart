import 'package:flutter/material.dart';
import '../widgets/export_widgets.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

class Calendar extends StatefulWidget {
  Calendar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  var _currentDate;
  var _markedDateMap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: TapBar(
          title: 'Watering Schedule',
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Your plants are thirsty!'),
              Container(
                margin: EdgeInsets.all(16),
                child: CalendarCarousel<Event>(
                  onDayPressed: (DateTime date, List<Event> events) {
                    this.setState(() => _currentDate = date);
                  },
                  weekendTextStyle: TextStyle(
                    color: Colors.teal,
                  ),
                  thisMonthDayBorderColor: Colors.grey,
                  todayButtonColor: Colors.teal,
                  headerTextStyle: TextStyle(color: Colors.teal, fontWeight: FontWeight.normal, fontSize: 20),
                  weekdayTextStyle: TextStyle(color: Colors.teal, fontWeight: FontWeight.normal, fontSize: 14),
                  iconColor: Colors.teal,
//      weekDays: null, /// for pass null when you do not want to render weekDays
//      headerText: Container( /// Example for rendering custom header
//        child: Text('Custom Header'),
//      ),
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

                    // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
                    if (day.day == 15) {
                      return Center(
                        child: Icon(Icons.wb_sunny),
                      );
                    } else {
                      return null;
                    }
                  },
                  weekFormat: false,
                  markedDatesMap: _markedDateMap,
                  height: 420.0,
                  selectedDateTime: _currentDate,
                  daysHaveCircularBorder: null,

                  /// null for not rendering any border, true for circular border, false for rectangular border
                ),
              ),
            ]
        ));
  }
}