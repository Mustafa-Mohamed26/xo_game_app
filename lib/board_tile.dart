import 'package:flutter/material.dart';

class BoardTile extends StatelessWidget {
  String symbol;
  BoardTile({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: symbol.isEmpty
            ? SizedBox()
            : Image.asset('assets/images/$symbol.png'),
      ),
    );
  }
}
