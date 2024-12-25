import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/helper.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:on_audio_query/on_audio_query.dart';

class FrequentlyPlayedArtwork extends StatelessWidget {
  const FrequentlyPlayedArtwork({
    super.key,
    required this.singleSong,
  });

  final SongModelClass singleSong;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 200,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: QueryArtworkWidget(
            controller: Helper.query,
            id: singleSong.songid,
            type: ArtworkType.AUDIO,
            nullArtworkWidget: const Icon(
              Icons.music_note,
              size: 110,
              color: Colors.green,
            ),
            artworkFit: BoxFit.cover,
            artworkHeight: 200,
            artworkWidth: 150,
            artworkBorder: BorderRadius.circular(10),
            artworkScale: 1,
          )),
    );
  }
}
