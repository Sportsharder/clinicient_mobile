import 'package:flutter/material.dart';
import '../widgets/navigationdrawer.dart';
import '../models/export_models.dart';
import 'calendar.dart';
import 'game_signoff_today.dart';
import 'game_appts.dart';
import 'game_other.dart';

class TAB {
  static const int DETAIL = 0;
  static const int AVATAR = 1;
  static const int HEALTH = 2;
}

class Gamification extends StatefulWidget {
  // final UserFurnace userFurnace;
  final int tab;

  // FlutterManager({Key key, this.title}) : super(key: key);
  Gamification({
    Key key,
    this.tab = 0,
  }) : super(key: key);
// final String title;

  @override
  _GamificationState createState() => _GamificationState();
}

class _GamificationState extends State<Gamification> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _goHome(),
        child: DefaultTabController(
          length: 3,
          initialIndex: widget.tab,
          child: Scaffold(
            drawer: NavigationDrawer(),
            appBar: AppBar(
              backgroundColor: Color(0xffEF8D69F),
              bottom: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Text('Today',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                  Text('Week',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                  Text('Month',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                ],
              ),
              title: Text('Gamification!!'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Calendar(),
                        ),
                        ModalRoute.withName("/home"));
                  },
                )
              ],
            ),
            //drawer: NavigationDrawer(),
            body: TabBarView(
              children: [
                GamificationSignoffToday(),
                GamificationAppointments(),
                GamificationOther(),

                // FlutteringSettings()
              ],
            ),
          ),
        ));
  }

  _goHome() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Calendar()),
        (Route<dynamic> route) => false);
  }


}
