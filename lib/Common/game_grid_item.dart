import 'package:BundEllerBosse/Models/Games.dart';
import 'package:flutter/material.dart';

/// This is the widget used for each single game. And is used to display the game in ie. grid views

class GameGridItem extends StatelessWidget {
  final GamesModel games;

  GameGridItem({this.games});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Test for GameGridItem",
        ),
      ),
    );
  }
}
