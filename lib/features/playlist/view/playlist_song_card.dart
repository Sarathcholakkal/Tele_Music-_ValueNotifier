import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/helper.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/playlist/logic/db_function.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlaylistSongsCard extends StatefulWidget {
  final SongModelClass songItem;
  final int playlistId;

  const PlaylistSongsCard(
      {super.key, required this.songItem, required this.playlistId});

  @override
  State<PlaylistSongsCard> createState() => _PlaylistSongsCardState();
}

class _PlaylistSongsCardState extends State<PlaylistSongsCard> {
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
                  id: widget.songItem.songid,
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
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirm Delete"),
                        content: const Text(
                            "Are you sure you want to delete this song?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              removeSongFromPlaylist(
                                  widget.playlistId, widget.songItem);

                              Navigator.of(context).pop();
                            },
                            child: const Text("Delete"),
                          ),
                        ],
                      );
                    },
                  );
                  // removeSongFromPlaylist(widget.playlistId, widget.songItem);
                },
                icon: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
