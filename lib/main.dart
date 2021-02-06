import 'package:flutter/material.dart';
import 'package:property_turkey_app/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property Turkey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white70,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.red.shade900,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme: TextTheme(
            title: TextStyle(
              color: Color.fromARGB(255, 185, 48, 6),
              fontWeight: FontWeight.w300,
              fontSize: 26
            ),
          ),
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 185, 48, 6),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


