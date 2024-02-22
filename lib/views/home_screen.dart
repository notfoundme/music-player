import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/model/song_data.dart';
import 'package:music_player/widgets/single_music_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 108, 108),
        title: Text(
          "Home",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return SingleMusicCard(
              image: songs[index].image,
              title: songs[index].title,
              content: songs[index].content,
              url: songs[index].url);
        },
      ),
    );
  }
}
