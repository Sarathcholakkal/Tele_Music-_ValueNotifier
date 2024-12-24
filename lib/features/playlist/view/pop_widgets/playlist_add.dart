import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/pallets.dart';
import 'package:musicme/features/playlist/logic/db_function.dart';
import 'package:musicme/features/playlist/view/playlist_song_select_screen.dart';

class PlaylistHead extends StatelessWidget {
  final BuildContext parentcontext;
  final TextEditingController controller;

  const PlaylistHead(
      {super.key, required this.parentcontext, required this.controller});
  Future<String?> openDialog() => showDialog(
        context: parentcontext,
        builder: (context) => AlertDialog(
          title: const Text("create a playlist"),
          content: TextField(
            autofocus: true,
            controller: controller,
            decoration: const InputDecoration(hintText: "Enter your name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // createPlaylist(controller.text);
                createPlaylist(controller.text);
              },
              child: const Text("submitt"),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () async {
              await openDialog();
            },
            child: Card(
              elevation: 20,
              child: Container(
                height: 60,
                width: 160,
                padding: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.playlist_add,
                      size: 25,
                      color: Pallete.logoGreenColor,
                    ),
                    Text("New Playlist")
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const PlaylistSongSelectScreen(),
                ),
              );
            },
            child: Card(
              elevation: 20,
              child: Container(
                height: 60,
                width: 160,
                padding: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.check_box,
                      size: 20,
                      color: Pallete.logoGreenColor,
                    ),
                    Text("Add Songs")
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
