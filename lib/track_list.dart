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
  List<Track>? _tracks;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 12; i++) {
      _tracks?.add(Track(
          title: "Part " + i.toString(),
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
    return ListView.builder(
      itemCount: _tracks?.length,
      padding: const EdgeInsets.all(16.0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _buildTrack(index);
      },
    );
  }

  Widget _buildTrack(int index) {
    return ListTile(
        title: Text(_tracks!.elementAt(index).title),
        trailing: Text(_tracks!.elementAt(index).time),
        onTap: () {
          setState(() {
            selectedTrack ??= _tracks!.elementAt(index);

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlayPodcast(track: _tracks![index])),
            );
          });
        });
  }
}
