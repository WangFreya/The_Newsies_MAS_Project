import 'package:flutter/material.dart';
import 'package:newsies_sprint3_prototype/playlist_header.dart';
import 'package:newsies_sprint3_prototype/reading_mat.dart';
import 'package:newsies_sprint3_prototype/track_list.dart';

class FilePlaylist extends StatefulWidget {
  final ReadingMat reading;
  const FilePlaylist({Key? key, required this.reading}) : super(key: key);

  @override
  _FilePlaylistState createState() => _FilePlaylistState();
}

class _FilePlaylistState extends State<FilePlaylist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const <Widget>[PlaylistHeader(), TrackList()],
      ),
    );
  }
}
