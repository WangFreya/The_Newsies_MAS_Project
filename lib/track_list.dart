import 'package:flutter/material.dart';
import 'package:newsies_sprint3_prototype/bookrow.dart';
import 'package:newsies_sprint3_prototype/play_podcast.dart';
import 'package:newsies_sprint3_prototype/track.dart';

class TrackList extends StatefulWidget {
  const TrackList({Key? key}) : super(key: key);

  @override
  _TrackListState createState() => _TrackListState();
}

class _TrackListState extends State<TrackList> {
  // final track1 = Track(
  //     title: "Part 1",
  //     time: "5:03",
  //     url:
  //         "https://mas-newsies-output.s3.us-east-2.amazonaws.com/gatsby_snip.txt.mp3");
  // final track2 = Track(title: "Part 2", time: "4:57", url: "");
  // final track3 = Track(title: "Part 3", time: "5:12", url: "");
  final List<Track> _tracks = [];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 12; i++) {
      _tracks.add(Track(
          title: "Part " + (i + 1).toString(),
          time: "5:00",
          url:
              "https://mas-newsies-output.s3.amazonaws.com/05TheGreatGatsby_segment_" +
                  i.toString() +
                  ".txt.mp3"));
    }
  }

  Track? selectedTrack;

  @override
  Widget build(BuildContext context) {
    return _buildTrackList();
  }

  Widget _buildTrackList() {
    return Expanded(
        child: ListView.builder(
      itemCount: _tracks.length,
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
        title: Text(_tracks.elementAt(index).title),
        trailing: Text(_tracks.elementAt(index).time),
        onTap: () {
          setState(() {
            selectedTrack ??= _tracks.elementAt(index);

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlayPodcast(track: _tracks[index])),
            );
          });
        });
  }
}
