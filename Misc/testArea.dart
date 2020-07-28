import 'dart:convert';

import 'package:BundEllerBosse/Models/Games.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

Widget BuildGamesLibraryWidget(){
  return FutureBuilder(
    future: fetchGamesFromJSON(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {


      }
    },
  );

}

Future<List<GamesModel>> fetchGamesFromJSON() async {
  final dataLocation = await rootBundle.loadString("Assets/data/games.json");

  // Get the JSON data from the response
  final List<dynamic> data = json.decode(dataLocation);

  // Convert JSON to Pokemons by using the named constructor fromJson
  return data.map((json) => GamesModel.fromJson(json)).toList();
}