import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/helper.dart';
import 'package:musicme/common/widgets/moving_text.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/all_songs/view/all_song_popup.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ListSongCard extends StatelessWidget {
  final SongModelClass songItem;
  const ListSongCard({super.key, required this.songItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: QueryArtworkWidget(
                  controller: Helper.query,
                  id: songItem.songid,
                  type: ArtworkType.AUDIO,
                  nullArtworkWidget: const Icon(
                    Icons.music_note,
                    size: 40,
                    color: Colors.white, // Set icon color
                  ),
                  artworkFit: BoxFit.cover,
                  artworkBorder: BorderRadius.circular(0),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            SizedBox(
              width: 240,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovingText(name: songItem.displayNameWOExt),
                    Text(
                      songItem.artist,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ]),
            ),
            const Spacer(),
            SizedBox(
              width: 50,
              child: MenuNewButton(songItem: songItem),
            )
          ],
        ),
      ),
    );
  }
}
