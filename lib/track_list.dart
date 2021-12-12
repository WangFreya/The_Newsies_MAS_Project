import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:newsies_sprint3_prototype/bookrow.dart';
import 'package:newsies_sprint3_prototype/play_podcast.dart';
import 'package:newsies_sprint3_prototype/track.dart';
import 'package:http/http.dart' as http;
import 'package:mp3_info/mp3_info.dart';

class TrackList extends StatefulWidget {
  final List<Track> tracks;
  const TrackList({Key? key, required this.tracks})
      : super(
          key: key,
        );

  @override
  _TrackListState createState() => _TrackListState();
}

class _TrackListState extends State<TrackList> {
  late String tempTime = '';

  // @override
  // void initState() {
  //   for (var i = 0; i < 12; i++) {
  //     // int time = 0;
  //     String url =
  //         "https://mas-newsies-output.s3.amazonaws.com/05TheGreatGatsby_segment_" +
  //             i.toString() +
  //             ".txt.mp3";
  //     //String time = "0";
  //     // getTime(url).then((value) {
  //     //   time = value!;
  //     // });
  //     getTime(url);
  //     _tracks.add(
  //         Track(title: "Part " + (i + 1).toString(), time: tempTime, url: url));
  //   }
  //   super.initState();
  // }

  // void getTime(String url) async {
  //   AudioPlayer player = AudioPlayer();
  //   var duration = await player.setUrl(url);
  //   setState(() {
  //     tempTime = duration!.inSeconds.toString();
  //   });
  // }

  Track? selectedTrack;

  @override
  Widget build(BuildContext context) {
    return _buildTrackList();
  }

  Widget _buildTrackList() {
    return Expanded(
        child: ListView.builder(
      itemCount: widget.tracks.length,
      padding: const EdgeInsets.all(16.0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _buildTrack(index);
      },
    ));
  }

  Widget _buildTrack(int index) {
    return ListTile(
        title: Text(widget.tracks.elementAt(index).title),
        trailing: Text(widget.tracks.elementAt(index).time),
        onTap: () {
          setState(() {
            selectedTrack ??= widget.tracks.elementAt(index);

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PlayPodcast(track: widget.tracks[index])),
            );
          });
        });
  }
}
