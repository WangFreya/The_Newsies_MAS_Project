import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsies_sprint3_prototype/play_podcast.dart';
import 'package:newsies_sprint3_prototype/track.dart';

class PlaylistHeader extends StatefulWidget {
  const PlaylistHeader({Key? key}) : super(key: key);

  @override
  _PlaylistHeaderState createState() => _PlaylistHeaderState();
}

class _PlaylistHeaderState extends State<PlaylistHeader> {
  final track1 = Track(
      title: "Part 1",
      time: "5:03",
      url:
          "https://mas-newsies-output.s3.us-east-2.amazonaws.com/gatsby_snip.txt.mp3");
  final track2 = Track(title: "Part 2", time: "4:57", url: "");
  final track3 = Track(title: "Part 3", time: "5:12", url: "");
  late List<Track> _tracks;
  late int numFiles;
  late int runtime;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    numFiles = 12;
    runtime = numFiles * 5;
    return Row(
      children: [
        Expanded(
            child: Column(
          children: [
            const Text(
              "The Great Gatsby",
              style: TextStyle(height: 5, fontSize: 24),
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                const SizedBox(width: 20),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PlayPodcast(track: _tracks[0])),
                      );
                    },
                    child: const Text('PLAY'),
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)))),
                SizedBox(width: 200.0),
                Text(numFiles.toString() +
                    " files | " +
                    runtime.toString() +
                    " min")
              ],
            )
          ],
        ))
      ],
    );
  }
}
