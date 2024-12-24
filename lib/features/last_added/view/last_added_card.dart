import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/helper.dart';
import 'package:musicme/common/widgets/moving_text.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:on_audio_query/on_audio_query.dart';

class LastAddedCard extends StatelessWidget {
  final SongModelClass singleSong;

  const LastAddedCard({super.key, required this.singleSong});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Album image
          SizedBox(
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
          ),
          const SizedBox(height: 5),
          MovingText(name: singleSong.displayNameWOExt),

          Text(
            singleSong.artist,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
