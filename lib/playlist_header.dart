import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsies_sprint3_prototype/play_podcast.dart';
import 'package:newsies_sprint3_prototype/track.dart';
import 'package:newsies_sprint3_prototype/reading_mat.dart';

class PlaylistHeader extends StatefulWidget {
  final List<Track> tracks;
  const PlaylistHeader({Key? key, required this.tracks}) : super(key: key);

  @override
  _PlaylistHeaderState createState() => _PlaylistHeaderState();
}

class _PlaylistHeaderState extends State<PlaylistHeader> {
  late int numFiles;
  late int runtime;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    numFiles = widget.tracks.length;
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
                                PlayPodcast(track: widget.tracks[0])),
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
