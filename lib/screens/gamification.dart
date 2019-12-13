import 'package:flutter/material.dart';
import '../widgets/navigationdrawer.dart';
import '../models/export_models.dart';
import 'calendar.dart';
import 'game_signoff_today.dart';
import 'game_signoff_week.dart';
import 'game_signoff_month.dart';

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

              iconTheme: new IconThemeData(color:Color(0xffE202E4A)),
              //title: Text('Patient Details', style: TextStyle(color: Color(0xffE202E4A)),),


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
              title: Text('Sign Off Leaderboard', style: TextStyle(color: Color(0xffE202E4A))),
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
                GamificationSignoffWeek(),
                GamificationSignoffMonth(),

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
