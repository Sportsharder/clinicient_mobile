import 'package:flutter/material.dart';
import '../widgets/navigationdrawer.dart';
import '../models/export_models.dart';
import 'calendar.dart';
import 'game_signoff_today.dart';
import 'game_signoff_week.dart';
import 'game_signoff_month.dart';
import 'slackerboard_bytime.dart';
import 'slackerboard_bycount.dart';

class TAB {
  static const int DETAIL = 0;
  static const int AVATAR = 1;
  static const int HEALTH = 2;
}

class Slackerboard extends StatefulWidget {
  // final UserFurnace userFurnace;
  final int tab;

  // FlutterManager({Key key, this.title}) : super(key: key);
  Slackerboard({
    Key key,
    this.tab = 0,
  }) : super(key: key);
// final String title;

  @override
  _SlackerboardState createState() => _SlackerboardState();
}

class _SlackerboardState extends State<Slackerboard> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _goHome(),
        child: DefaultTabController(
          length: 2,
          initialIndex: widget.tab,
          child: Scaffold(
            drawer: NavigationDrawer(),
            appBar: AppBar(
              backgroundColor: Color(0xffEF8D69F),
              bottom: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Text('By Time',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                  Text('By Count',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                ],
              ),
              title: Text('Slackerboard'),
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
                SlackerBoardByTime(),
                SlackerBoardByCount(),

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
