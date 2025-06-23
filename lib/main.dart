import 'package:flutter/material.dart';
import 'package:xo_game_app/game_boarding_screen.dart';
import 'package:xo_game_app/home_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        GameBoardingScreen.routeName: (context) => const GameBoardingScreen(),
      },
      home: HomeScreen(),
    );
  }
}