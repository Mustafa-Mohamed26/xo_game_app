import 'package:flutter/material.dart';

typedef OnPlayerClick = void Function(int);
class BoardTile extends StatelessWidget {
  String symbol;
  int index;
  OnPlayerClick onPlayerClick;
  BoardTile({super.key, required this.symbol,required this.index, required this.onPlayerClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onPlayerClick(index);
        },
        child: symbol.isEmpty
            ? Container()
            : Image.asset('assets/images/$symbol.png'),
      ),
    );
  }
}
