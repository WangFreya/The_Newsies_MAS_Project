import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:newsies_sprint3_prototype/track.dart';

class PlayPodcast extends StatefulWidget {
  final Track track;

  const PlayPodcast({Key? key, required this.track}) : super(key: key);

  @override
  _PlayPodcastState createState() => _PlayPodcastState();
}

class _PlayPodcastState extends State<PlayPodcast> {
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  //String url = track.url
  int timeProgress = 0;
  int audioDuration = 0;

  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          value: timeProgress.toDouble(),
          max: audioDuration.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  @override
  void initState() {
    super.initState();

    /// Compulsory
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        audioPlayerState = state;
      });
    });

    audioPlayer.setUrl(widget.track
        .url); // Triggers the onDurationChanged listener and sets the max duration string
    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration.inSeconds;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration position) async {
      setState(() {
        timeProgress = position.inSeconds;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.release();
    audioPlayer.dispose();
    super.dispose();
  }

  playMusic() async {
    // Add the parameter "isLocal: true" if you want to access a local file
    await audioPlayer.play(widget.track.url);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    audioPlayer
        .seek(newPos); // Jumps to the given position within the audio file
  }

  String getTimeString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString'; // Returns a string with the format mm:ss
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Compulsory
              IconButton(
                  iconSize: 50,
                  onPressed: () {
                    PlayerState == PlayerState.PLAYING
                        ? pauseMusic()
                        : playMusic();
                  },
                  icon: Icon(PlayerState == PlayerState.PLAYING
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded)),

              /// Optional
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(getTimeString(timeProgress)),
                  SizedBox(width: 20),
                  Container(width: 200, child: slider()),
                  SizedBox(width: 20),
                  Text(getTimeString(audioDuration))
                ],
              )
            ],
          )),
    );
  }
}
