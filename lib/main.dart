import 'package:flutter/material.dart';
import 'package:hardtec_app/homePage.dart';

import 'pages/splash.dart';


void main() {
  runApp(new MaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
    routes: {"/homepage": (_) => NoticeHardTec()},
  ));
}