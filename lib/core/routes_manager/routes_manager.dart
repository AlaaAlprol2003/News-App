import 'package:flutter/material.dart';
import 'package:news_app/features/home/home_screen.dart';
import 'package:news_app/features/search/search_screen.dart';
import 'package:news_app/features/splash/splash_screen.dart';

class RoutesManager {
  static const String splashScreen = "/splash_screen";
  static const String homeScreen = "/home_screen";
  static const String searchScreen = "/search_screen";

  


  static Map<String,WidgetBuilder>  router = {
    splashScreen : (context)=> SplashScreen(),
    homeScreen   : (context)=> HomeScreen(),
    searchScreen : (context)=> SearchScreen(),
    
  };
}