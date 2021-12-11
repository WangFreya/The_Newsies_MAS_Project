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
  final track1 = Track(title: "Audio File 1", time: "5:06");
  final track2 = Track(title: "Audio File 2", time: "4:57");
  final track3 = Track(title: "Audio File 3", time: "5:12");
  late List<Track> _tracks;

  @override
  void initState() {
    super.initState();
    _tracks = <Track>[track1, track2, track3];
  }

  Track? selectedTrack;

  @override
  Widget build(BuildContext context) {
    return _buildTrackList();
  }

  Widget _buildTrackList() {
    return ListView.builder(
      itemCount: _tracks.length,
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
        title: Text(_tracks.elementAt(index).title),
        trailing: Text(_tracks.elementAt(index).time),
        onTap: () {
          setState(() {
            selectedTrack ??= _tracks.elementAt(index);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PlayPodcast()),
            );

            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             ListenerScreen(track: _tracks[index])));
          });
        });
  }
}
