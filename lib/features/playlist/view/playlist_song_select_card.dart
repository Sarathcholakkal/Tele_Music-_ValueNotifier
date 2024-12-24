import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/helper.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlaylistSongSelectCard extends StatefulWidget {
  final SongModelClass songItem;
  final bool boxValue;
  final ValueNotifier<List<bool>> checkBoxValues;
  final int indx;

  const PlaylistSongSelectCard(
      {super.key,
      required this.songItem,
      required this.boxValue,
      required this.checkBoxValues,
      required this.indx});

  @override
  State<PlaylistSongSelectCard> createState() => _PlaylistSongSelectCardState();
}

class _PlaylistSongSelectCardState extends State<PlaylistSongSelectCard> {
  ValueNotifier<bool> ischecked = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Checkbox(
                value: widget.boxValue,
                onChanged: (newValue) {
                  if (newValue != null) {
                    List<bool> updatedValues =
                        List.from(widget.checkBoxValues.value);
                    updatedValues[widget.indx] = newValue;
                    widget.checkBoxValues.value = updatedValues;
                  }
                }),
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
                  id: widget.songItem.songid,
                  type: ArtworkType.AUDIO,
                  nullArtworkWidget: const Icon(
                    Icons.music_note,
                    size: 40,
                    color: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
