import 'package:flutter/material.dart';
import 'package:musicme/features/playlist/logic/db_function.dart';
import 'package:musicme/features/playlist/model/playlist_model.dart';
import 'package:popover/popover.dart';

class PlaylistMenuButton extends StatelessWidget {
  final PlaylistModelClass playlist;

  const PlaylistMenuButton({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => PopupMenu(playlist: playlist),
            // onPop: () => print('Popover was popped!'),
            direction: PopoverDirection.right,
            backgroundColor: Colors.white.withOpacity(0.12),
            width: 150,
            height: 91,
            arrowHeight: 10,
            arrowWidth: 10,
          );
        },
        icon: const Icon(Icons.more_vert));
  }
}

class PopupMenu extends StatefulWidget {
  final PlaylistModelClass playlist;

  const PopupMenu({super.key, required this.playlist});

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController(text: widget.playlist.name);
    // _updateFavoriteStatus();
    super.initState();
  }

  //================================
  Future<String?> openRenamDialog() => showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Rename playlist playlist"),
          content: TextField(
            autofocus: true,
            controller: controller,
            decoration: const InputDecoration(hintText: "Enter new name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                renamePlaylist(widget.playlist.id!, controller.text);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text("submitt"),
            )
          ],
        ),
      );

  //=========================================
  Future<dynamic> showDeletePlaylsit(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Delete"),
          content: const Text("Are you sure you want to delete this item?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                deletePlaylist(widget.playlist.id!);
                // Perform the delete action

                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  //========================
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: TextButton.icon(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 12)),
              onPressed: () async {
                openRenamDialog();
              },
              icon: const Icon(
                Icons.edit,
              ),
              label: const Text(
                "Rename",
                style: TextStyle(color: Colors.white),
              )),
        ),
        const Divider(
          height: 1,
        ),
        SizedBox(
          height: 50,
          child: TextButton.icon(
            style:
                TextButton.styleFrom(textStyle: const TextStyle(fontSize: 12)),
            onPressed: () {
              showDeletePlaylsit(context);
            },
            icon: const Icon(Icons.delete), // Add your desired icon
            label: const Text(
              "Delete",
              style: TextStyle(color: Colors.white),
            ), // Add your desired text
          ),
        ),
      ],
    );
  }
}
