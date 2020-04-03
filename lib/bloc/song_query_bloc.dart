import 'dart:async';

import 'package:songs/models/songModal.dart';
import 'package:songs/resources/getSongsApi.dart';

import 'bloc.dart';

class SongQueryBloc implements Bloc {
  final _controller = StreamController<List<Song>>();
  final _client = SongClient();
  Stream<List<Song>> get songStream => _controller.stream;

  getQuery() async {
    // 1
    final results = await _client.fetchSongs();
    print("submitQuery results now are : $results");
    if (results != 'Error') {
      _controller.sink.add(results);
      return true;
    } else
      return false;
  }

  @override
  void dispose() {
    _controller.close();
  }
}
