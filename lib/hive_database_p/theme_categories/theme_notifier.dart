

import 'package:flutter/foundation.dart';

class ThemeNotifier extends ChangeNotifier{
  bool isDarkTheme = false;

  bool getTheme() => isDarkTheme;

  // Events

 void toggleTheme(bool isDarkThem){
   isDarkTheme = isDarkThem;
   notifyListeners();
 }




}