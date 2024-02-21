import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/constants/extensions.dart';

class SongPage extends StatelessWidget {
  const SongPage({Key? key}) : super(key: key);

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
    return ProgressBar(
      barHeight: 8,
      baseBarColor: Colors.grey[600],
      bufferedBarColor: Colors.grey,
      progressBarColor: Colors.red,
      thumbColor: Colors.red,
      timeLabelTextStyle:
          TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      progress: Duration(seconds: 200),
      total: Duration(minutes: 5),
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
      actions: [const Icon(Icons.menu)],
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
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Icon(
              Icons.skip_previous,
              size: 32,
            ),
          ),
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 15, 108, 108),
            radius: 40,
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
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
