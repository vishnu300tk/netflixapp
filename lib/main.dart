

import 'package:flutter/material.dart';


import 'package:netflixapp/presentation/downloads/home/screen_home.dart';

import 'package:netflixapp/splashscreen.dart';






void main(){
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: Colors.black)
      ),
      
      home:   const SplashScreen(
        child: ScreenhomePage(),
      
         ),   // home: const ScreenhomePage(),
    );
  }
}
