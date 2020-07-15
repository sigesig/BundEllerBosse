import 'dart:collection';

class GameCard {
 String gamename;
 String description;
 List<String> needed;
 String image;

  GameCard(this.gamename,this.description,this.image,this.needed);
  // Constructor used for conversion from JSON to Games.
  factory GameCard.fromJson(Map<String, dynamic> json){
    return GameCard(
      json['gamename'] as String,
      json['description'] as String,
      json['image'] as String,
      (json['needed'] as List)?.map((e) => e as String)?.toList(),
    );
  }
}

