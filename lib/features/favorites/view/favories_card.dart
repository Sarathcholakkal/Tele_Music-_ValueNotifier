import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/helper.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/favorites/logic/db_function.dart';
import 'package:on_audio_query/on_audio_query.dart';

class FavoriteCard extends StatefulWidget {
  final SongModelClass songItem;
  const FavoriteCard({super.key, required this.songItem});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  final ValueNotifier<bool> _isFavorite = ValueNotifier<bool>(true);

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
                  id: widget.songItem.id ?? 0,
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
                  Text(
                    widget.songItem.displayNameWOExt,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    widget.songItem.artist,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, color: Colors.white24),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 50,
              child: IconButton(
                  onPressed: () {
                    if (widget.songItem.key != null) {
                      removeFavoriteSongs(widget.songItem.key);
                    } else {}
                  },
                  icon: ValueListenableBuilder<bool>(
                      valueListenable: _isFavorite,
                      builder: (context, isenbled, _) {
                        return Icon(
                          isenbled ? Icons.favorite : Icons.favorite_border,
                        );
                      })),
            )
          ],
        ),
      ),
    );
  }
}
