import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../services/device_service.dart';
import '../services/securestorage_service.dart';
import 'bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
import '../models/export_models.dart';
import 'dart:io' show Platform;

FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
new FlutterLocalNotificationsPlugin();

class FirebaseBloc implements BlocBase {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  //FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  void resetToken() {
    _firebaseMessaging.getToken();
  }

  FirebaseBloc() {
    _firebaseMessaging.setAutoInitEnabled(true);

    var initializationSettingsAndroid =
    new AndroidInitializationSettings('@drawable/notification');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    print("Registered FCM Listeners");

    _firebaseMessaging.getToken().then((token) {
      _saveToken(token);
    });

    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          print('FIREBASE onMessage');
          _processMessage(message, true);
        },
        //onBackgroundMessage: Platform.isAndroid ? messageHandler : null,
        //onBackgroundMessage: messageHandler,
        onLaunch: (Map<String, dynamic> message) async {
          print('FIREBASE onLaunch');
          _processMessage(message, false);
        }, onResume: (Map<String, dynamic> message) async {
      print('FIREBASE onResume');
      _processMessage(message, false);
    });
  }

  removeNotification() async {
    _flutterLocalNotificationsPlugin.cancelAll();
  }

  _processMessage(Map<String, dynamic> message, bool showNotification) async {
    /**
     *
     * TITLE return values
     *
     */

    print('test');

    //notify the world
  }

  Future _saveToken(String fireToken) async {
    print("New FireToken: " + fireToken);

    String currentKey = await SecureStorageService.readKey(KeyType.FIRETOKEN);

    if (currentKey != fireToken) {
      globalState.fireToken = fireToken;
      await SecureStorageService.writeKey(KeyType.FIRETOKEN, fireToken);
      await DeviceService.updateFireToken(fireToken);
    }

    return;
  }

  Future onSelectNotification(String payload) async {
    print("what is this");
    /*
    showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("PayLoad"),
          content: Text("Payload : $payload"),
        );
      },
    );
    */
  }

  dispose() async {
    //_movieId.close();
  }
}

Future<dynamic> messageHandler(Map<String, dynamic> message) async {
  print('BACKGROUND MESSAGE HANDLER FIRED OFF');

}

Future showNotificationWithDefaultSound(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'your channel id', 'your channel name', 'your channel description',
      importance: Importance.Default, priority: Priority.Default);
  var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
  var platformChannelSpecifics = new NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

//await flutterLocalNotificationsPlugin.
  await flutterLocalNotificationsPlugin.show(
    0,
    'IronCircles',
    'New Activity in IronCircles',
    platformChannelSpecifics,
    payload: 'Default_Sound',
  );
}