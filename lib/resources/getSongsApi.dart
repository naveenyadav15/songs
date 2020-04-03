import 'dart:async';
import 'dart:convert' show json;

import 'package:http/http.dart' as http;
import 'package:songs/models/songModal.dart';

class SongClient {
  fetchSongs() async {
    final results = await request();

    print("result type: ${results.runtimeType}");
    bool error = results["feed"] == null ? true : false;
    final suggestions = error ? results['error'] : results["feed"]["results"];
    print("suggestions are : $suggestions");
    return error
        ? suggestions
        : suggestions
            .map<Song>((json) => Song.fromJson(json))
            .toList(growable: false);
  }

  Future<Map> request() async {
    final url =
        'https://rss.itunes.apple.com/api/v1/in/apple-music/new-releases/all/100/non-explicit.json';
    try {
      final results = await http.get(url);

      print("results: ${results.request}");
      print("results: ${results.body}");
      final jsonObject = json.decode(results.body);
      return jsonObject;
    } catch (e) {
      return {'error': 'Error'};
    }
  }
}
