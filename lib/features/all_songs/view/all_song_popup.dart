import 'package:flutter/material.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/favorites/logic/db_function.dart';
import 'package:musicme/features/playback/logic/favorite_checker.dart';
import 'package:popover/popover.dart';

class MenuNewButton extends StatelessWidget {
  final SongModelClass songItem;
  const MenuNewButton({super.key, required this.songItem});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => PopupMenu(songItem: songItem),
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
  final SongModelClass songItem;
  const PopupMenu({super.key, required this.songItem});

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  final ValueNotifier<bool> _isFavorite = ValueNotifier<bool>(false);
  @override
  void initState() {
    _updateFavoriteStatus();
    super.initState();
  }

  //================================
  Future<void> _updateFavoriteStatus() async {
    final isFavorite = await checkFavorite(widget.songItem);
    _isFavorite.value = isFavorite;
  }

  //========================
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: TextButton.icon(
            style:
                TextButton.styleFrom(textStyle: const TextStyle(fontSize: 12)),
            onPressed: () async {
              _isFavorite.value = !_isFavorite.value;

              if (_isFavorite.value) {
                storeFavoriteSongs(widget.songItem);
              } else {
                removeFavoriteSongs(widget.songItem.key);
              }
              Navigator.of(context).pop();
            },
            icon: ValueListenableBuilder<bool>(
              valueListenable: _isFavorite,
              builder: (context, isenbled, _) {
                return Icon(
                  isenbled ? Icons.favorite : Icons.favorite_border,
                );
              },
            ),
            label: ValueListenableBuilder<bool>(
              valueListenable: _isFavorite,
              builder: (context, isenbled, _) {
                return isenbled
                    ? const Text(
                        "Remove from Favorites",
                        style: TextStyle(color: Colors.white),
                      )
                    : const Text(
                        "Add to favorites",
                        style: TextStyle(color: Colors.white),
                      );
              },
            ), // Add your desired text
          ),
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
              List<SongModelClass> selectedsongs = [];
              selectedsongs.add(widget.songItem);
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (ctx) =>
              //         PlaylistSelectScreen(selectedSongs: selectedsongs),
              //   ),
              // );
              // print("Button Pressed!");
            },
            icon: const Icon(Icons.playlist_add), // Add your desired icon
            label: const Text(
              "Add to playlist",
              style: TextStyle(color: Colors.white),
            ), // Add your desired text
          ),
        ),
      ],
    );
  }
}
