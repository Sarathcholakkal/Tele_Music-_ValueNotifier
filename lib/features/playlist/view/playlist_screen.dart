import 'package:flutter/material.dart';
import 'package:musicme/features/playlist/logic/db_function.dart';
import 'package:musicme/features/playlist/model/playlist_model.dart';
import 'package:musicme/features/playlist/view/pop_up_widged.dart/playlist_add.dart';
import 'package:musicme/features/playlist/view/playlist_card.dart';
import 'package:musicme/features/playlist/view/playlist_song_screen.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    getAllPlaylists();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            title: Text(
              "Playlists",
              style: TextStyle(fontSize: 25, letterSpacing: .8),
            ),
          ),
          PlaylistHead(parentcontext: context, controller: controller),
          // AddPlaylistWidget(parentcontext: context, controller: controller),

          Expanded(
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
                      return GestureDetector(
                        onDoubleTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) =>
                                  PlaylistSongsScreen(playlist: playlist),
                            ),
                          );
                        },
                        child: PlaylistCard(playlist: playlist),
                      );
                    },
                    separatorBuilder: (BuildContext ctx, int indx) =>
                        const SizedBox(
                      height: 10,
                    ),
                    itemCount: playlists.length,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
