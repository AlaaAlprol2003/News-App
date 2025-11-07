import 'package:flutter/material.dart';
import 'package:news_app/core/resources/colors_manager.dart';

class ThemeManager {
  static final  ThemeData light = ThemeData();
  static  ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.black,
       
    )
  );

}