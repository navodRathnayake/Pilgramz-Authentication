import 'package:flutter/material.dart';

class AppUI extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  void toggleAction(bool isOn) {
    if (isOn) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  bool isOn() {
    if (_themeMode == ThemeMode.system) {
      return _themeMode == ThemeMode.dark;
    } else {
      return _themeMode == ThemeMode.dark;
    }
  }

  ThemeMode get themeModeState => _themeMode;
}

class UIPackage {
  static final darkUI = ThemeData.dark();
  static final lightUI = ThemeData.light();
}
