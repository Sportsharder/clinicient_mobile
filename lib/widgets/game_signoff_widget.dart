import 'package:flutter/material.dart';
import '../models/export_models.dart';

class GamificationSignoffWidget extends StatelessWidget {
  final SignedVisit currentRow;
  final int index;

  GamificationSignoffWidget(this.currentRow, this.index);

  Widget build(BuildContext context) {
    Color color;

    Color fontColor = Color(0xffE202E4A);

    if (index.isEven) {
      color = Colors.white30;
    } else {
      color = Colors.white70;
    }

    return Card(
        color: color,
        child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: CircleAvatar(
                      child: Text(
                        (index + 1).toString(),
                        style: TextStyle(color: fontColor),
                      ),
                      backgroundColor:Color(0xffEF8D69F),
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                        _getTherapistImage(currentRow.staffFirstName),
                        //fit: BoxFit.fill,
                        //height: 40,
                        width: 65,
                        height: 50,
                        fit: BoxFit.fitWidth),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                  ),
                  Expanded(
                    child: Text(
                      currentRow.staffFirstName +
                          ' ' +
                          currentRow.staffLastName,
                      style: TextStyle(fontSize: 14, color:fontColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                  ),
                  Expanded(
                    child: Text(
                      currentRow.signedVisits.toString(),
                      style: TextStyle(fontSize: 14, color:fontColor),
                    ),
                  ),
                ])));
  }

  String _getTherapistImage(String firstName) {
    String retValue;

    switch (firstName) {
      case 'Marianne':
        {
          retValue = 'assets/marianne.jpg';
          break;
        }
      case 'Kent':
        {
          retValue = 'assets/kentrowe.jpg';
          break;
        }
      case 'John':
        {
          retValue = 'assets/johnmcneil.jpg';
          break;
        }
      case 'Stevie':
        {
          retValue = 'assets/stevie.png';
          break;
        }
      case 'Roland':
        {
          retValue = 'assets/roland.png';
          break;
        }
      case 'Mutt':
        {
          retValue = 'assets/mutt.png';
          break;
        }
      case 'Ted':
        {
          retValue = 'assets/ted.png';
          break;
        }
      case 'Twila':
        {
          retValue = 'assets/twila.png';
          break;
        }
      default:
        {
          retValue = 'assets/spongesil.png';
          break;
        }
    }

    return retValue;
  }
}
