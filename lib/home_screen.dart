import 'package:flutter/material.dart';
import 'package:xo_game_app/game_boarding_screen.dart';
import 'package:xo_game_app/player_choice.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Pick who goes first",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(GameBoardingScreen.routeName, arguments: 'x');
                        },
                        child: PlayerChoice(symbol: 'x'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(GameBoardingScreen.routeName, arguments: 'o');
                        },
                        child: PlayerChoice(symbol: 'o'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
