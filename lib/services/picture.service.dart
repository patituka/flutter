import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<List<Album>> fetchAlbum() async {
  final response = await http.get(
    'https://api.unsplash.com/photos',
    headers: {
      DotEnv().env['UNSPLASH_API_KEY']: DotEnv().env['UNSPLASH_API_SECRET']
    },
  );

  if (response.statusCode == 200) {
    return (response.body as List)
          .map((x) => Album.fromJson(x))
          .toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final String id;
  final int width;
  final int height;
  final String color;
  final int likes;
  final String description;
  final UnsplashUrl urls;

  Album(
      {this.id,
      this.width,
      this.height,
      this.color,
      this.likes,
      this.description,
      this.urls});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      color: json['color'],
      likes: json['likes'],
      description: json['description'],
      urls: json['urls'],
    );
  }
}

class UnsplashUrl {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;
}
