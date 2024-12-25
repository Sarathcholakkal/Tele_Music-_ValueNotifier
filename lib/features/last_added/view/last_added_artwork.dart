import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/helper.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:on_audio_query/on_audio_query.dart';

class LastAddedArtWork extends StatelessWidget {
  const LastAddedArtWork({
    super.key,
    required this.singleSong,
  });

  final SongModelClass singleSong;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: QueryArtworkWidget(
            controller: Helper.query,
            id: singleSong.songid,
            type: ArtworkType.AUDIO,
            nullArtworkWidget: const Icon(
              Icons.music_note,
              size: 130,
              color: Colors.green, // Set icon color
            ),
            artworkFit: BoxFit.cover,
            artworkHeight: 140,
            artworkWidth: 140,
            artworkBorder: BorderRadius.circular(0),
            artworkScale: 1,
          )),
    );
  }
}
