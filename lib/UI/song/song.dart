import 'package:flutter/material.dart';
import 'package:songs/UI/song/songDetail.dart';
import 'package:songs/models/songModal.dart';
import 'package:songs/util/placeholder_content.dart';
import 'package:songs/util/utility.dart';
import 'package:songs/util/variable.dart';

class SongPage extends StatefulWidget {
  final bloc;
  SongPage({@required this.bloc});
  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  bool _isLoading = true;
  bool status = false;
  @override
  initState() {
    super.initState();

    initAlbum();
  }

  void initAlbum() async {
    status = await widget.bloc.getQuery();
    setState(() {
      _isLoading = false;
    });
  }

  Widget _buildGridCards(BuildContext context, Song song) {
    // return songs.map((song) {
    print("we have a song here is: ${song.name}");
    // Song song = Song();
    return Card(
      child: InkResponse(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: song?.name ?? 'op',
              child: AspectRatio(
                aspectRatio: 18 / 16,
                child: getImage(song),
              ),
            ),
            Expanded(
              child: Padding(
                // padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                padding: EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            song?.name ?? 'kl',
                            style: TextStyle(fontSize: 18.0),
                            maxLines: 2,
                          ),
                        ),
                        Icon(Icons.more_vert),
                      ],
                    ),
                    Container(
                      height: cHeight * 0.01,
                    ),
                    Text(
                      song?.artistName ?? 'kl',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return SongDetail(song);
          }));
          /*Navigator
                .of(context)
                .push( MaterialPageRoute(builder: (_) {
              return  CardDetail(widget.db, song, 0);
            }));*/
        },
      ),
    );
    // }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    // final bloc = SongQueryBloc();
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : !status
            ? PlaceHolderContent(
                title: "Problem Occurred",
                message: "Internet not connect try again",
                tryAgainButton: _tryAgainButtonClick,
              )
            : StreamBuilder<Object>(
                stream: widget.bloc.songStream,
                builder: (context, snapshot) {
                  // print("snapshot is: $snapshot");
                  List<Song> results = snapshot.data;
                  print("snapshot type: ${snapshot.data.runtimeType}");
                  if (results == null) {
                    return Center(child: Text('Loading...'));
                  }

                  if (results.isEmpty) {
                    return Center(child: Text('No Results'));
                  }
                  return Container(
                    child: GridView.builder(
                      itemCount: results.length,
                      padding: EdgeInsets.all(2.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            orientation == Orientation.portrait ? 2 : 4,
                        childAspectRatio: 8.0 / 10.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return _buildGridCards(context, results[index]);
                      },
                    ),
                  );
                });
  }

  _tryAgainButtonClick(bool _) => initAlbum();
}
