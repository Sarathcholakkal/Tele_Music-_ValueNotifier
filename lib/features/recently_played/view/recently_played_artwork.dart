import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/helper.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:on_audio_query/on_audio_query.dart';

class RecentlyPlayedArtWork extends StatelessWidget {
  const RecentlyPlayedArtWork({
    super.key,
    required this.singleSong,
  });

  final SongModelClass singleSong;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 110,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0.0),
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
          artworkHeight: 110,
          artworkWidth: 110,
          artworkBorder: BorderRadius.circular(10),
          artworkScale: 1,
        ),
      ),
    );
  }
}
