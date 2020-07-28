import 'package:BundEllerBosse/Common/game_category_list_widget.dart';
import 'package:BundEllerBosse/Common/game_grid_item.dart';
import 'package:BundEllerBosse/Models/Games.dart';
import 'package:flutter/material.dart';

class GamesCategoryWidget extends StatelessWidget {
  final List<GamesModel> game;
  final String categoryName;

  GamesCategoryWidget({this.categoryName, this.game});

  @override
  Widget build(BuildContext context) {
    List<Widget> list = game.map((g) => GameGridItem(games: g)).toList();
    return GestureDetector(
      onTap: (){
        //TODO: Fix this to later, so that it will stay on same page and not use navigator
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GameCategoryListWidget(games: list)),
        );
      },
      child: Container(
        color: Colors.blueGrey,
        child: Center(
          child: Text(
            categoryName,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ),
    );
  }
}
