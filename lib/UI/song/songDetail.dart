import 'package:flutter/material.dart';
import 'package:songs/models/songModal.dart';
import 'package:songs/util/utility.dart';
import 'package:songs/util/variable.dart';

class SongDetail extends StatefulWidget {
  final Song song;
  SongDetail(
    this.song,
  );
  @override
  _SongDetailState createState() => _SongDetailState();
}

class _SongDetailState extends State<SongDetail> {
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: orientation == Orientation.portrait ? 350.0 : 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                widget.song.name,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 14.0,
                  // decoration: TextDecoration.underline,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Hero(
                    tag: widget.song.name,
                    child: getImage(widget.song),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  // widget.mode == 0 ? widget.song.album :
                  widget.song.name,
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  widget.song.artistName,
                  style: TextStyle(fontSize: 14.0),
                  maxLines: 1,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, top: 10.0, bottom: 10.0),
                // child: Text("1 song(s)"),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Genres",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ))),
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              widget.song.genres.map((Genre key) {
                return Container(
                  padding: const EdgeInsets.only(left: 8.0, top: 10.0),
                  alignment: Alignment.bottomLeft,
                  child: Chip(
                    label: Text(
                      key.name,
                      maxLines: 1,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      // flo
    );
  }
}
