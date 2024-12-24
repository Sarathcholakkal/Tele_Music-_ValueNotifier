import 'package:flutter/material.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';

import 'package:musicme/features/playlist/logic/db_function.dart';
import 'package:musicme/features/playlist/model/playlist_model.dart';

class PlaylistSelectScreen extends StatefulWidget {
  final List<SongModelClass> selectedSongs;

  const PlaylistSelectScreen({super.key, required this.selectedSongs});

  @override
  State<PlaylistSelectScreen> createState() => _PlaylistSelectScreenState();
}

class _PlaylistSelectScreenState extends State<PlaylistSelectScreen> {
  @override
  void initState() {
    getAllPlaylists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select Playlist",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: ValueListenableBuilder<List<PlaylistModelClass>>(
              valueListenable: playlistNotifier,
              builder: (BuildContext context,
                  List<PlaylistModelClass> playlists, _) {
                if (playlists.isEmpty) {
                  return const Center(
                    child: Text("No playlists found found."),
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext ctx, int indx) {
                    final playlist = playlists[indx];
                    playlist.id;
                    return ListTile(
                      onTap: () {
                        addSongsToPlaylist(playlist.id!, widget.selectedSongs);
                        Navigator.of(context).pop();
                      },
                      leading: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      title: Text(playlist.name),
                    );
                  },
                  separatorBuilder: (BuildContext ctx, int indx) =>
                      const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: SizedBox(),
                  ),
                  itemCount: playlists.length,
                );
              }),
        ),
      ),
    );
  }
}
