import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/pallets.dart';
import 'package:musicme/features/playlist/model/playlist_model.dart';

class PlaylistRename extends StatefulWidget {
  final PlaylistModelClass
      playlist; // Playlist object passed to the constructor
  final BuildContext parentContext;

  const PlaylistRename(
      {super.key, required this.playlist, required this.parentContext});

  @override
  State<PlaylistRename> createState() => _PlaylistRenameState();
}

class _PlaylistRenameState extends State<PlaylistRename> {
  late TextEditingController controller;

  Future<String?> openRenameDialog() => showDialog(
        context: widget.parentContext,
        builder: (context) => AlertDialog(
          title: const Text("Rename Playlist"), // Can use const for static text
          content: TextField(
            autofocus: true,
            controller: controller,
            decoration: InputDecoration(
                hintText: "Enter new name for '${widget.playlist.name}'"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final newName = controller.text.trim();
                Navigator.of(context).pop(newName.isNotEmpty ? newName : null);
              },
              child: const Text("Submit"), // Static text can be const
            ),
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
              controller.text =
                  widget.playlist.name; // Pre-fill with current name
              final newName = await openRenameDialog();
              if (newName != null && newName != widget.playlist.name) {
                renamePlaylist(newName);
              }
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
                  // This Row can be const
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.edit,
                      size: 25,
                      color: Pallete
                          .logoGreenColor, // Pallete should be defined or imported
                    ),
                    Text("Rename Playlist"), // Text is constant
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void renamePlaylist(String newName) {
    // Logic to update the playlist name
    widget.playlist.name = newName;
    print("Playlist renamed to: $newName");
    // Optionally, add logic to update the name in a database or state management
  }
}
