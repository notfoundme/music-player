import 'dart:async';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/constants/extensions.dart';

class SongPage extends StatefulWidget {
  final String url;
  const SongPage({Key? key, required this.url}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  bool isPlaying = true;
  AudioPlayer audioPlayer = AudioPlayer();
  Duration totalMusicDuration = Duration();
  Duration currentDuration = Duration();
  // to cancel the stream after its no longer in use.
  late StreamSubscription s1;

  @override
  void initState() {
    s1 = audioPlayer.positionStream.listen((event) {
      currentDuration = event;
      setState(() {});
    });
    super.initState();
    audioPlayer.setUrl(widget.url).then(
      (value) {
        totalMusicDuration = value!;
        setState(() {});
      },
    ).then((_) => audioPlayer.play());
  }

  @override
  void dispose() {
    s1.cancel();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 25),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    width: context.width * 0.9,
                    'assets/img.png',
                    fit: BoxFit.cover,
                  ),
                ),
                songDescriptionCard()
              ],
            ),
            Column(
              children: [
                songProgressBar(),
                playBtnsRow(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget songProgressBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ProgressBar(
        //to make the song interactive while seeked
        onSeek: (d) {
          audioPlayer.seek(d);
        },
        barHeight: 8,
        baseBarColor: Colors.grey[600],
        bufferedBarColor: Colors.grey,
        progressBarColor: Colors.red,
        thumbColor: Colors.red,
        timeLabelTextStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
        progress: currentDuration,
        total: totalMusicDuration,
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 15, 108, 108),
      leading: const BackButton(),
      title: Text(
        "song page",
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
      ),
    );
  }

  Padding songDescriptionCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // width: context.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Ve Haaliyaan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Ve Haaliyaan| official video |Ravi Dubey ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }

  Widget playBtnsRow() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                audioPlayer.seek(Duration(seconds: 5));
              },
              child: Icon(
                Icons.skip_previous,
                size: 32,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (!isPlaying) {
                audioPlayer.play();
              } else {
                audioPlayer.pause();
              }
              isPlaying = !isPlaying;
              setState(() {});
            },
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 15, 108, 108),
              radius: 40,
              child: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Icon(
              Icons.skip_next,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
