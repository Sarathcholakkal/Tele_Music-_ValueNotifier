import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/helper.dart';
import 'package:musicme/common/widgets/moving_text.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:on_audio_query/on_audio_query.dart';

class FrequentlyCard extends StatelessWidget {
  final SongModelClass singleSong;

  const FrequentlyCard({super.key, required this.singleSong});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Album image
          SizedBox(
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
          ),
          const SizedBox(height: 5),
          MovingText(name: singleSong.displayNameWOExt),

          Text(
            singleSong.artist,
            style: TextStyle(fontSize: 12, color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
