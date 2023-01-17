
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
String language ='en';
@override
  void notifyListener(String LanguageCode) {
  language=LanguageCode;
    notifyListeners();
  }
}