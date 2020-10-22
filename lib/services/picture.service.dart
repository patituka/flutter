import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/models/picture.dart';

Future<List<Picture>> fetchAlbum() async {
  String url =
      '${DotEnv().env['UNSPLASH_URL']}?client_id=${DotEnv().env['UNSPLASH_API_KEY']}';

  final response = await http.get(url);

  if (response.statusCode == 200) {
    return (json.decode(response.body) as List)
        .map((i) => Picture.fromJson(i))
        .toList();
  } else {
    throw Exception('Failed to load album');
  }
}
