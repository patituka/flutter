import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<List<Album>> fetchAlbum() async {
  String url =
      '${DotEnv().env['UNSPLASH_URL']}?client_id=${DotEnv().env['UNSPLASH_API_KEY']}';

  final response = await http.get(url);

  if (response.statusCode == 200) {
    return (json.decode(response.body) as List)
        .map((i) => Album.fromJson(i))
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
      urls: UnsplashUrl.fromJson(json['urls'] as Map<String, dynamic>),
    );
  }
}

class UnsplashUrl {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  UnsplashUrl(this.raw, this.full, this.regular, this.small, this.thumb);

  factory UnsplashUrl.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return UnsplashUrl(json['raw'], json['full'], json['regular'],
          json['small'], json['thumb']);
    } else {
      return null;
    }
  }
}
