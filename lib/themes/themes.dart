import 'package:flutter/material.dart';
//lightmode
ThemeData lightmode =ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade900
  )
);
//darkmode
ThemeData darkMode =ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Color(0xFF000F24),
    primary: Colors.grey.shade400,
    secondary: Colors.grey.shade200
  )
);