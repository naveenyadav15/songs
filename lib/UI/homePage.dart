import 'package:flutter/material.dart';
import 'package:songs/UI/song/song.dart';
import 'package:songs/bloc/song_query_bloc.dart';

import 'package:songs/bloc/bloc_provider.dart';
import 'package:songs/util/variable.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = SongQueryBloc();
    cHeight = MediaQuery.of(context).size.height;
    cWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Top 100 Songs'),
        ),
        body: BlocProvider<SongQueryBloc>(
          bloc: bloc,
          child: SongPage(
            bloc: bloc,
          ),
        ),
      ),
    );
  }
}
