import 'package:flutter/material.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ArtworkDisplaySection extends StatelessWidget {
  final List<SongModelClass> songs;
  final ValueNotifier<int> currentSongIndex;

  const ArtworkDisplaySection(
      {super.key, required this.songs, required this.currentSongIndex});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentSongIndex,
      builder: (context, index, child) {
        return ArtworkDisplay(currentSong: songs[index]);
      },
    );
  }
}

class ArtworkDisplay extends StatelessWidget {
  final SongModelClass currentSong;

  const ArtworkDisplay({super.key, required this.currentSong});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 325,
      child: QueryArtworkWidget(
        id: currentSong.songid,
        type: ArtworkType.AUDIO,
        artworkFit: BoxFit.cover,
        artworkBorder: BorderRadius.circular(10),
        artworkWidth: 300,
        artworkHeight: 325,
        nullArtworkWidget: const Icon(
          Icons.music_note,
          size: 50,
        ),
      ),
    );
  }
}
