import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/songModel.dart';
import '../Provider/musicPlayerProvider.dart';


class PlaylistPage extends StatelessWidget {
  const PlaylistPage({super.key});

  List<Song> get songs => [
    Song(
      title: 'Tech House Vibes',
      artist: 'A&K',
      imagePath: 'assets/images/song1.jpg',
      audioPath: 'assets/audio/song1.mp3',
    ),
    Song(
      title: 'Summer Hits',
      artist: 'Hits',
      imagePath: 'assets/images/song2.jpg',
      audioPath: 'assets/audio/song2.mp3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final playerProvider = Provider.of<MusicPlayerProvider>(context);
    final currentSong = playerProvider.currentSong;

    return Scaffold(
      appBar: AppBar(title: const Text("My Playlist")),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          final isPlaying = song == currentSong && playerProvider.isPlaying;
          return ListTile(
            leading: Image.asset(song.imagePath, width: 50, height: 50),
            title: Text(song.title),
            subtitle: Text(song.artist),
            trailing: IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: () {
                playerProvider.togglePlay(song);
              },
            ),
          );
        },
      ),
    );
  }
}
