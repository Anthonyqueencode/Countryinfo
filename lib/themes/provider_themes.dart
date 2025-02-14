import 'package:flutter/material.dart';
import 'package:mycountryapp/themes/themes.dart';


class ProviderThemes with ChangeNotifier{
  ThemeData _themeinfo = lightmode;

  ThemeData get themeData => _themeinfo;
  set themeData(ThemeData themeData){
    _themeinfo = themeData;
    notifyListeners();

  }

  void screenChanger(){
    if (_themeinfo ==lightmode ){
      themeData = darkMode;
    }else{
      themeData = lightmode;
    }
  }
}