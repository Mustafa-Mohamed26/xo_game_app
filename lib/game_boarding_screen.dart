import 'package:flutter/material.dart';
import 'package:xo_game_app/board_tile.dart';

class GameBoardingScreen extends StatelessWidget {
  static const String routeName = 'game_boarding_screen';
  const GameBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00D2FF), Color(0xFF3A7BD5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(44),
                    color: Colors.white,
                  ),
                  child: Text(
                    '00:05',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Player 1's Turn",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(44),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BoardTile(symbol: ''),
                              Container(width: 1, color: Colors.black,),
                              BoardTile(symbol: ''),
                              Container(width: 1, color: Colors.black,),
                              BoardTile(symbol: ''),
                            ],
                          ),
                        ),
                        Container(height: 1, color: Colors.black,),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BoardTile(symbol: ''),
                              Container(width: 1, color: Colors.black,),
                              BoardTile(symbol: ''),
                              Container(width: 1, color: Colors.black,),
                              BoardTile(symbol: ''),
                            ],
                          ),
                        ),
                        Container(height: 1, color: Colors.black,),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BoardTile(symbol: ''),
                              Container(width: 1, color: Colors.black,),
                              BoardTile(symbol: ''),
                              Container(width: 1, color: Colors.black,),
                              BoardTile(symbol: ''),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
