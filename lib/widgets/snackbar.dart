import 'package:flutter/material.dart';

class CLSnackBar {
  static void showSnackbar(scaffoldKey, String message, String actionText, int duration) {
    final snackBar = SnackBar(
      backgroundColor:Colors.grey, content: Text(message.replaceAll("Exception: ", ""),
        style: TextStyle(color: Colors.white, fontSize: 16.0)),
      duration: Duration(seconds: duration),
      action: actionText.isNotEmpty
          ? SnackBarAction(
        label: actionText,
        textColor: Colors.white,
        onPressed: () {
          // Some code to undo the change!
        },
      )
          : null, );

    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
