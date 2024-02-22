import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/constants/extensions.dart';
import 'package:music_player/views/song_screen.dart';

class SingleMusicCard extends StatelessWidget {
  const SingleMusicCard({
    super.key,
    required this.image,
    required this.title,
    required this.content,
    required this.url,
  });

  final String image;
  final String title;
  final String content;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              height: context.height * 0.1,
              width: context.width * 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //Column for texts
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  content,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ],
            ),

            GestureDetector(
              onTap: () {
                context.navigateto(SongPage(
                  url: url,
                ));
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20,
                  child: Icon(
                    Icons.play_arrow_rounded,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
