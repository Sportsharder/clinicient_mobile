import 'package:flutter/material.dart';
import '../screens/calendar.dart';
import 'dart:io';

class TapBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  TapBar({Key key, this.title})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _TapBarState createState() => _TapBarState();
}

class _TapBarState extends State<TapBar> {
//class Tapbar extends StatelessWidget {
  //Tapbar();

  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      backgroundColor: Colors.teal,
      actions: <Widget>[
        Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Calendar(title: 'Insight Mobile',)),
                          (Route<dynamic> route) => false);
                }))
      ],
    );
  }
}