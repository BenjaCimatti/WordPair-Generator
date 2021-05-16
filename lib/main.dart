import 'package:flutter/material.dart';
import 'random_words.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple[900],
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          headline1: const TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w300,
            color: Colors.white,
            fontFamily: 'Poppins'
          ),
          headline2: const TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.w200,
            color: Colors.white,
            fontFamily: 'Poppins'
          ),
        ),
      ),
      themeMode: ThemeMode.dark, 
      home: RandomWord()
    );
  }
}