import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:pilgramz/API/Auth/AuthServices.dart';
import 'package:pilgramz/Pages/LoginSignin.dart';
import 'package:pilgramz/Pages/PostView.dart';
import 'package:pilgramz/Pages/Settings.dart';
import 'package:pilgramz/Root.dart';
import 'package:provider/provider.dart';

import 'Utils/Theme Data.dart';
import 'package:flutter/material.dart';
import 'package:pilgramz/Pages/myHomePage.dart';

import 'testcases.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    ThemeData themedata = Theme.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pilgramz',
      theme: UITheme.lightTheme(screenWidth),
      darkTheme: UITheme.darkTheme(screenWidth),
      themeMode: ThemeMode.light,
      home: AuthServices().handleAuthState(themedata), //Root(),
      routes: <String, WidgetBuilder>{
        "settings": (context) => const SettingsPage(),
        "main": (context) => MyHomePage(themedata: themedata),
        "root": (context) => const Root(),
        "Login": (context) => LoginSignin(themedata: themedata)
      },
    );
  }
}

class UITheme {
  static ThemeData lightTheme(double screenWidth) {
    ThemeData theme = ThemeData(
      textTheme: screenWidth < 750 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
      fontFamily: "Ubuntu",
      brightness: Brightness.light,
      primaryColor: PRIMARY_COLOR_LIGHT,
      secondaryHeaderColor: COLOR_GREY_CANVAS,
      iconTheme: const IconThemeData(color: Colors.black),
      primaryIconTheme: const IconThemeData(color: Colors.white),
      primaryColorDark: Colors.black,
    );
    return theme;
  }

  static ThemeData darkTheme(double screenWidth) {
    ThemeData theme = ThemeData(
      textTheme:
          screenWidth < 750 ? TEXT_THEME_SMALL_DARK : TEXT_THEME_DEFAULT_DARK,
      fontFamily: "Ubuntu",
      brightness: Brightness.dark,
      primaryColor: PRIMARY_COLOR_DARK,
      secondaryHeaderColor: COLOR_GREY,
      iconTheme: const IconThemeData(color: Colors.black),
      primaryIconTheme: const IconThemeData(color: Colors.black),
      primaryColorDark: Colors.white,
    );
    return theme;
  }
}
