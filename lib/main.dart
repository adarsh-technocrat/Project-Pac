import 'package:evento/Database/FirebaseRepo.dart';
import 'package:evento/DynamicThemeing/models_provider/themeprovider.dart';
import 'package:evento/Screen/IntroductionScreen.dart';
import 'package:evento/Screen/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import './appLocalization/appLocalization.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // this is how we initialize the firebase app
  await Firebase.initializeApp();
  final appDocumentDirectory =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  final setting = await Hive.openBox('settings');
  bool isLightTheme = setting.get('isLightTheme') ?? true;
  print(isLightTheme);
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(isLightTheme: isLightTheme),
    child: AppStart(),
  ));
}

// to ensure we have the themeProvider before the app starts
class AppStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MyApp(themeProvider: themeProvider);
  }
}

class MyApp extends StatefulWidget with WidgetsBindingObserver {
  final ThemeProvider themeProvider;

  const MyApp({Key key, this.themeProvider}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FireBaseRepo _firebaseRepo = FireBaseRepo();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evento',
      theme: widget.themeProvider.themeData(),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('hi', 'IN'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocal in supportedLocales) {
          if (supportedLocal.languageCode == locale.languageCode &&
              supportedLocal.countryCode == locale.countryCode) {
            return supportedLocal;
          }
        }
        return supportedLocales.first;
      },
      home: FutureBuilder(
          future: _firebaseRepo.getCurrentUser(),
          builder: (context, AsyncSnapshot<User> snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return IntroductionScreen();
            }
          }),
      initialRoute: "/",
    );
  }
}
