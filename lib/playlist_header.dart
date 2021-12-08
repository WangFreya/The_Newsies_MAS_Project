import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsies_sprint3_prototype/track.dart';

class PlaylistHeader extends StatefulWidget {
  const PlaylistHeader({Key? key}) : super(key: key);

  @override
  _PlaylistHeaderState createState() => _PlaylistHeaderState();
}

class _PlaylistHeaderState extends State<PlaylistHeader> {
  final track1 = Track(title: "Audio File 1", time: "5:06");
  final track2 = Track(title: "Audio File 2", time: "4:57");
  final track3 = Track(title: "Audio File 3", time: "5:12");
  late List<Track> _tracks;
  late String numFiles;

  @override
  void initState() {
    super.initState();
    _tracks = <Track>[track1, track2, track3];
  }

  // String calcRuntime() {
  //   int runtime;
  //   _tracks.forEach((Track track) {
  //     min = track.time[0];
  //   })
  // }

  @override
  Widget build(BuildContext context) {
    numFiles = _tracks.length.toString();
    return Row(
      children: [
        Expanded(
            child: Column(
          children: [
            const Text(
              "File you want to listen to",
              style: TextStyle(height: 5, fontSize: 24),
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                const SizedBox(width: 20),
                TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           ListenerScreen(track: _tracks[0])));
                    },
                    child: const Text('PLAY'),
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)))),
                SizedBox(width: 200.0),
                Text(numFiles + " files | 15 min")
              ],
            )
          ],
        ))
      ],
    );
  }
}
