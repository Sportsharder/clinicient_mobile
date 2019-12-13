library GlobalState;
import 'export_models.dart';

final GlobalState globalState = new GlobalState._private();

class GlobalState {
  GlobalState._private();

  String fireToken;
  String appPath;
  bool loggingOut = false;
  //int therapistID;
  Therapist therapist;

  //home variables
  DateTime lastSelectedDate;
}