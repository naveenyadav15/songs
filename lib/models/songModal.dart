// To parse this JSON data, do
//
//     final songModal = songModalFromJson(jsonString);

import 'dart:convert';

SongModal songModalFromJson(String str) => SongModal.fromJson(json.decode(str));

String songModalToJson(SongModal data) => json.encode(data.toJson());

class SongModal {
    List<Song> songs;

    SongModal({
        this.songs,
    });

    factory SongModal.fromJson(Map<String, dynamic> json) => SongModal(
        songs: json["songs"] == null ? null : List<Song>.from(json["songs"].map((x) => Song.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "songs": songs == null ? null : List<dynamic>.from(songs.map((x) => x.toJson())),
    };
}

class Song {
    String artistName;
    String id;
    DateTime releaseDate;
    String name;
    String kind;
    String copyright;
    String artistId;
    String artistUrl;
    String artworkUrl100;
    List<Genre> genres;
    String url;

    Song({
        this.artistName,
        this.id,
        this.releaseDate,
        this.name,
        this.kind,
        this.copyright,
        this.artistId,
        this.artistUrl,
        this.artworkUrl100,
        this.genres,
        this.url,
    });

    factory Song.fromJson(Map<String, dynamic> json) => Song(
        artistName: json["artistName"] == null ? null : json["artistName"],
        id: json["id"] == null ? null : json["id"],
        releaseDate: json["releaseDate"] == null ? null : DateTime.parse(json["releaseDate"]),
        name: json["name"] == null ? null : json["name"],
        kind: json["kind"] == null ? null : json["kind"],
        copyright: json["copyright"] == null ? null : json["copyright"],
        artistId: json["artistId"] == null ? null : json["artistId"],
        artistUrl: json["artistUrl"] == null ? null : json["artistUrl"],
        artworkUrl100: json["artworkUrl100"] == null ? null : json["artworkUrl100"],
        genres: json["genres"] == null ? null : List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "artistName": artistName == null ? null : artistName,
        "id": id == null ? null : id,
        "releaseDate": releaseDate == null ? null : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "name": name == null ? null : name,
        "kind": kind == null ? null : kind,
        "copyright": copyright == null ? null : copyright,
        "artistId": artistId == null ? null : artistId,
        "artistUrl": artistUrl == null ? null : artistUrl,
        "artworkUrl100": artworkUrl100 == null ? null : artworkUrl100,
        "genres": genres == null ? null : List<dynamic>.from(genres.map((x) => x.toJson())),
        "url": url == null ? null : url,
    };
}

class Genre {
    String genreId;
    String name;
    String url;

    Genre({
        this.genreId,
        this.name,
        this.url,
    });

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        genreId: json["genreId"] == null ? null : json["genreId"],
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "genreId": genreId == null ? null : genreId,
        "name": name == null ? null : name,
        "url": url == null ? null : url,
    };
}
