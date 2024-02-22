class SongData {
  final String title;
  final String content;
  final String url;
  final String image;

  SongData({
    required this.content,
    required this.title,
    required this.url,
    required this.image,
  });
}

List<SongData> songs = [
  SongData(
    content: "Lorem ipsum 1",
    title: "Song 1",
    url: "https://sample-videos.com/audio/mp3/crowd-cheering.mp3",
    image: "https://example.com/song1.jpg",
  ),
  SongData(
    content: "Lorem ipsum 2",
    title: "Song 2",
    url: "https://sample-videos.com/audio/mp3/wave.mp3",
    image: "https://example.com/song2.jpg",
  ),
  SongData(
    content: "Lorem ipsum 3",
    title: "Song 3",
    url: "https://samplelib.com/lib/preview/mp3/sample-15s.mp3",
    image: "https://example.com/song3.jpg",
  ),
  SongData(
    content: "Lorem ipsum 4",
    title: "Song 4",
    url: "https://sample-videos.com/audio/mp3/wave.mp3",
    image: "https://example.com/song4.jpg",
  ),
  SongData(
    content: "Lorem ipsum 5",
    title: "Song 5",
    url: "https://sample-videos.com/audio/mp3/wave.mp3",
    image: "https://example.com/song5.jpg",
  ),
];
