import 'package:flutter/material.dart';

class GameCategoryListWidget extends StatelessWidget {
  final List<Widget> games;

  GameCategoryListWidget({this.games});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        children: games,
      ),
    );
  }
}
