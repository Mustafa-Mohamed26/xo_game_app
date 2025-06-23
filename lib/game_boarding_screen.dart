import 'package:flutter/material.dart';
import 'package:xo_game_app/board_tile.dart';
import 'package:xo_game_app/game_boarding_args.dart';

class GameBoardingScreen extends StatefulWidget {
  static const String routeName = 'game_boarding_screen';
  GameBoardingScreen({super.key});

  @override
  State<GameBoardingScreen> createState() => _GameBoardingScreenState();
}

class _GameBoardingScreenState extends State<GameBoardingScreen> {
  List<String> boardState = ['', '', '', '', '', '', '', '', ''];

  int counter = 0;
  int player1Score = 0;
  int player2Score = 0;
  late GameBoardingArgs args;
  String title = "Player 1's Turn";

  void onPlayerClick(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      boardState[index] = args.firstPlayer;
      title = "Player 1's Turn";
    } else {
      boardState[index] = args.secondPlayer;
      title = "Player 2's Turn";
    }
    counter++;
    if (checkWinner(args.firstPlayer)) {
      title = "Player 1's Win";
      player1Score++;
      Future.delayed(Duration(seconds: 1), resetBoard);
    } else if (checkWinner(args.secondPlayer)) {
      title = "Player 2's Win";
      player2Score++;
      Future.delayed(Duration(seconds: 1), () => resetBoard());
    } else if (counter == 9) {
      title = "Non Player won";
      Future.delayed(Duration(seconds: 1), () => resetBoard());
    }
    setState(() {});
  }

  bool checkWinner(String symbol) {
    for (var i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }

    for (var i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }

    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }

    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }

    return false;
  }

  void resetBoard() {
    boardState = ['', '', '', '', '', '', '', '', ''];
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)?.settings.arguments as GameBoardingArgs;
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
                    '${args.firstPlayer}: $player1Score     &     ${args.secondPlayer}: $player2Score',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  title,
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
                              BoardTile(
                                symbol: boardState[0],
                                index: 0,
                                onPlayerClick: onPlayerClick,
                              ),
                              Container(width: 1, color: Colors.black),
                              BoardTile(
                                symbol: boardState[1],
                                index: 1,
                                onPlayerClick: onPlayerClick,
                              ),
                              Container(width: 1, color: Colors.black),
                              BoardTile(
                                symbol: boardState[2],
                                index: 2,
                                onPlayerClick: onPlayerClick,
                              ),
                            ],
                          ),
                        ),
                        Container(height: 1, color: Colors.black),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BoardTile(
                                symbol: boardState[3],
                                index: 3,
                                onPlayerClick: onPlayerClick,
                              ),
                              Container(width: 1, color: Colors.black),
                              BoardTile(
                                symbol: boardState[4],
                                index: 4,
                                onPlayerClick: onPlayerClick,
                              ),
                              Container(width: 1, color: Colors.black),
                              BoardTile(
                                symbol: boardState[5],
                                index: 5,
                                onPlayerClick: onPlayerClick,
                              ),
                            ],
                          ),
                        ),
                        Container(height: 1, color: Colors.black),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BoardTile(
                                symbol: boardState[6],
                                index: 6,
                                onPlayerClick: onPlayerClick,
                              ),
                              Container(width: 1, color: Colors.black),
                              BoardTile(
                                symbol: boardState[7],
                                index: 7,
                                onPlayerClick: onPlayerClick,
                              ),
                              Container(width: 1, color: Colors.black),
                              BoardTile(
                                symbol: boardState[8],
                                index: 8,
                                onPlayerClick: onPlayerClick,
                              ),
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
