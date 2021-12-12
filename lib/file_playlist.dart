import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:newsies_sprint3_prototype/playlist_header.dart';
import 'package:newsies_sprint3_prototype/reading_mat.dart';
import 'package:newsies_sprint3_prototype/track.dart';
import 'package:newsies_sprint3_prototype/track_list.dart';

class FilePlaylist extends StatefulWidget {
  final ReadingMat reading;
  const FilePlaylist({Key? key, required this.reading}) : super(key: key);

  @override
  _FilePlaylistState createState() => _FilePlaylistState();
}

class _FilePlaylistState extends State<FilePlaylist> {
  final List<Track> _tracks = [];
  String tempTime = '';
  @override
  void initState() {
    for (var i = 0; i < 12; i++) {
      // int time = 0;
      String url =
          "https://mas-newsies-output.s3.amazonaws.com/05TheGreatGatsby_segment_" +
              i.toString() +
              ".txt.mp3";
      //String time = "0";
      // getTime(url).then((value) {
      //   time = value!;
      // });
      getTime(url);
      _tracks.add(
          Track(title: "Part " + (i + 1).toString(), time: tempTime, url: url));
    }
    super.initState();
  }

  void getTime(String url) async {
    AudioPlayer player = AudioPlayer();
    var duration = await player.setUrl(url);
    setState(() {
      tempTime = duration!.inSeconds.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          PlaylistHeader(
            tracks: _tracks,
            reading: widget.reading,
          ),
          TrackList(
            tracks: _tracks,
          )
        ],
      ),
    );
  }
}
