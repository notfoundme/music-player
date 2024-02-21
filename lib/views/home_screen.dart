import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/widgets/single_music_card.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  final String content;
  final String image;
  HomeScreen(
      {super.key,
      required this.title,
      required this.content,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 15, 108, 108),
        title: Text(
          "Home",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
        actions: [Icon(Icons.search)],
      ),
      body: ListView.builder(
        itemCount: 25,
        itemBuilder: (context, index) {
          return SingleMusicCard(image: image, title: title, content: content);
        },
      ),
    );
  }
}
