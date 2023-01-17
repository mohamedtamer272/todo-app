import 'package:flutter/material.dart';

import '../model/tasks.dart';

class ThemeProvider extends ChangeNotifier {
ThemeMode theme =ThemeMode.light;
@override
  void notifyListener(ThemeMode themeCode) {
  theme=themeCode;
    notifyListeners();
  }
}