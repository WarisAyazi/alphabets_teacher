import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  final String word;
  final String voice;
  const ExamplePage({
    super.key,
    required this.word,
    required this.voice,
  });

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  var currentTime = DateTime.now().millisecondsSinceEpoch;
  var lastTime = 1755843659413;
  var hour = TimeOfDay.now();

  void _showDateDialog(path) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Continue Reading'),
        content: const Text(
          'You can not Read more than one word in one day Are you sure you want.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Continued to Reading')),
              );
              await audioPlayer.play(path);
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print('Current Time: $currentTime');
    print('Difference Between: ${currentTime - lastTime}');

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
    super.dispose();
    if (mounted) {
      audioPlayer.dispose();
    }
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
          'Exmple for   ${widget.word}',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Parastoo',
              fontSize: 24),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.word,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 150,
              fontWeight: FontWeight.bold,
              fontFamily: 'Parastoo',
            ),
          ),
          Container(
            height: 200,
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
                      final path = AssetSource(widget.voice);
                      if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        if (currentTime - lastTime > 3600000 /*3066514 */) {
                          _showDateDialog(path);
                        } else {
                          await audioPlayer.play(path);
                        }
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
