import 'package:flutter/material.dart';
import '../screens/calendar.dart';
import 'dart:io';
import '../models/globalstate.dart';

class ClappBarr extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool showHome;

  ClappBarr({Key key, this.title, @required this.showHome})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _ClappBarrState createState() => _ClappBarrState();
}

class _ClappBarrState extends State<ClappBarr> {
//class Tapbar extends StatelessWidget {
  //Tapbar();

  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: new IconThemeData(color:Color(0xffE202E4A)),
      title: Text(widget.title, style: TextStyle(color: Color(0xffE202E4A)),),
      backgroundColor: Color(0xffEF8D69F),
      actions: <Widget>[
        widget.showHome == false
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    icon: Icon(Icons.home, color: Color(0xffE202E4A)),
                    onPressed: () {
                      globalState.lastSelectedDate = null;

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Calendar()),
                          (Route<dynamic> route) => false);
                    }))
      ],
    );
  }
}
