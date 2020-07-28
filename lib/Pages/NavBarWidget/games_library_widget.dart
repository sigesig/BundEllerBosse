import 'dart:convert';

import 'package:BundEllerBosse/Common/games_category_widget.dart';
import 'package:BundEllerBosse/Models/Games.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///This widget is used for the page which shows all the game categories

class GamesLibraryWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          BuildGamesCategoryWidget('assets/games.json'),
          BuildGamesCategoryWidget('assets/games.json'),
        ],
      ),
    );
  }
}
Widget BuildGamesCategoryWidget(String dataString){
  return FutureBuilder(
    future: fetchGamesFromJSON(dataString),
    builder: (BuildContext context, AsyncSnapshot<List<GamesModel>> snapshot) {
      if (snapshot.hasData) {
        print("fetched data from");
        return GamesCategoryWidget(categoryName: "TEST NAME", game: snapshot.data);
      } else{
        return Center(child: CircularProgressIndicator());
      }
    },
  );

}

Future<String>_loadFromAsset(String dataString) async {
  return await rootBundle.loadString(dataString);
}

Future<List<GamesModel>> fetchGamesFromJSON(String dataString) async {
  WidgetsFlutterBinding.ensureInitialized();
  final String dataLocation = await _loadFromAsset(dataString);
  // Get the JSON data from the response
  final List<dynamic> data = await jsonDecode(dataLocation);
  // Convert JSON to Games by using the named constructor from Json
  return data.map((json) => GamesModel.fromJson(json)).toList();
}