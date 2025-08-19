import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  final String letter;
  const ExamplePage({
    super.key,
    required this.letter,
  });

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    // listen to states: playing, paused, stoped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    //listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      duration = newDuration;
    });

    //listen to audio position
    audioPlayer.onPositionChanged.listen((newPosition) {
      position = newPosition;
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  String _videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exmple for ${widget.letter}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Parastoo',
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              widget.letter,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 150,
                fontWeight: FontWeight.bold,
                fontFamily: 'Parastoo',
              ),
            ),
          ),
          Container(
            height: 280,
            child: Image.asset(
              'assets/masha-animation.png',
              fit: BoxFit.cover,
            ),
          ),
          Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            onChanged: (value) async {
              final position = Duration(seconds: value.toInt());
              await audioPlayer.seek(position);

              // optionaly: play audio if was paused
              await audioPlayer.resume();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_videoDuration(position)),
                CircleAvatar(
                  radius: 35,
                  child: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        final path = AssetSource('voices/Voice 001.m4a');
                        await audioPlayer.play(path);
                      }
                    },
                  ),
                ),
                Text(_videoDuration(duration - position)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
