import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:songs/models/songModal.dart';

dynamic getImage(Song song) {
  return song != null
      ? song.artworkUrl100 == null
          ? null
          : CachedNetworkImage(
              imageUrl: song.artworkUrl100,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.blue[100],
                      BlendMode.colorBurn,
                    ),
                  ),
                ),
              ),
              // placeholder: (context, url) =>
              //     CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )
      : Image.asset(
          "assets/images/back.jpg",
          height: 120.0,
          fit: BoxFit.cover,
        );
}
