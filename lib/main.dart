import 'package:flutter/material.dart';
import 'screens/default.dart';
import 'screens/calendar.dart';
import 'blocs/firebase_bloc.dart';
import 'blocs/bloc_provider.dart';
import 'models/export_models.dart';
import 'services/securestorage_service.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //dummy code to ensure import statement isn't tree shaken
  globalState.fireToken = await SecureStorageService.readKey(KeyType.FIRETOKEN);
  SecureStorageService.printKey(KeyType.FIRETOKEN);

  globalState.appPath = (await getApplicationDocumentsDirectory()).path;

  runApp(
    BlocProvider<FirebaseBloc>(
      bloc: FirebaseBloc(),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: DarkTheme.theme,
      debugShowCheckedModeBanner: false,
/*
        theme: ThemeData(
          primaryColor: ThemeColors.primaryColor,
          backgroundColor: ThemeColors.backgroundColor,
          scaffoldBackgroundColor: ThemeColors.scaffoldBackgroundColor,
          canvasColor: ThemeColors.canvasColor,
          hintColor: ThemeColors.hintColor,
        ),
*/
      routes: <String, WidgetBuilder>{
        //'/': (context) => Calendar(),
        '/home': (context) => Calendar(),
      },
      home: Calendar(),
    );
  }
}
