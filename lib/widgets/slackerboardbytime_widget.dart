import 'package:flutter/material.dart';
import '../models/export_models.dart';

class SlackerBoardByTimeWidget extends StatelessWidget {
  final SlackingByTime currentRow;
  final int index;

  SlackerBoardByTimeWidget(this.currentRow, this.index);

  Widget build(BuildContext context) {

    Color color;

    if (index.isEven) {
      color = Colors.white30;
    } else {
      color = Colors.white70;
    }

    return Card(
        color: color,
        child:Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: CircleAvatar(
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Color(0xffEF8D69F),
                ),
              ),
              Expanded(
                child:
                    Image.asset(_getTherapistImage(currentRow.staffFirstName),
                        //fit: BoxFit.fill,
                        //height: 40,
                        width: 65,
                        height: 50,
                        fit: BoxFit.fitWidth),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4),
              ),
              Expanded(
                child: Text(
                  currentRow.staffFirstName,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4),
              ),
              Expanded(
                child: Text(
                  currentRow.staffLastName,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4),
              ),
              Expanded(
                child: Text(
                  currentRow.totalSlackingTimeinHours.toString(),
                  style: TextStyle(fontSize: 16),
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
