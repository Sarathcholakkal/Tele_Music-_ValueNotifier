// import 'package:flutter/material.dart';
// import 'package:musicme/common/utils/const/layout_spacing.dart';
// import 'package:musicme/common/utils/const/pallets.dart';
// import 'package:musicme/features/all_songs/model/songmodel_class.dart';
// import 'package:musicme/features/playback/view/playback_screen.dart';
// import 'package:musicme/features/playlist/logic/db_function.dart';
// import 'package:musicme/features/playlist/model/playlist_model.dart';
// import 'package:musicme/features/playlist/view/playlist_song_card.dart';

// class PlaylistSongsScreen extends StatefulWidget {
//   final PlaylistModelClass playlist;

//   const PlaylistSongsScreen({super.key, required this.playlist});

//   @override
//   State<PlaylistSongsScreen> createState() => _PlaylistSongsScreenState();
// }

// class _PlaylistSongsScreenState extends State<PlaylistSongsScreen> {
//   final searchController = TextEditingController();
//   String? filter;
//   ValueNotifier<List<SongModelClass>> filteredsongsListNotifier =
//       ValueNotifier([]);
//   @override
//   void initState() {
//     super.initState();
//     searchController.addListener(() {
//       setState(() {
//         filter = searchController.text;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
//         // color: Colors.red,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             LayoutSpacer.vertical30,
//             SizedBox(
//               // height: 50,
//               child: Row(
//                 children: [
//                   SizedBox(
//                     height: 50,
//                     child: Row(
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             Navigator.of(context)
//                                 .pop(); // Properly navigates back to the previous screen
//                           },
//                           icon: const Icon(
//                             Icons.arrow_back_ios_outlined,
//                             color: Colors
//                                 .black, // Adjust the color to match your theme
//                           ),
//                         ),
//                         Expanded(
//                           child: TextFormField(
//                             keyboardType: TextInputType.text,
//                             controller: searchController,
//                             decoration: InputDecoration(
//                               hintText: 'What do you want to hear...',
//                               contentPadding:
//                                   const EdgeInsets.fromLTRB(20, 5, 10, 5),
//                               filled: true,
//                               fillColor: Colors.grey[
//                                   200], // Optional: background color for better visibility
//                               border: const OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(
//                                       12), // Adjust the radius as needed
//                                 ),
//                                 borderSide:
//                                     BorderSide.none, // Removes the border line
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // buildPageTitlteSection(widget.playlist.name),
//             SizedBox(
//               height: 40,
//               // color: Colors.red,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       filteredsongsListNotifier.value.shuffle();
//                       filteredsongsListNotifier.notifyListeners();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(160, 30),
//                     ),
//                     icon: const Icon(Icons.shuffle_rounded),
//                     label: const Text(
//                       'Shuffles Playback',
//                       style: TextStyle(fontSize: 10),
//                     ),
//                   ),
//                   SizedBox(
//                     child: Text(
//                       widget.playlist.name,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 19,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Expanded(
//               child: SizedBox(
//                 width: double.infinity,
//                 child: ValueListenableBuilder<List<PlaylistModelClass>>(
//                   valueListenable: playlistNotifier,
//                   builder: (context, newplaylists, child) {
//                     final updatedplaylist = newplaylists.firstWhere(
//                       (newplaylist) => newplaylist.id == widget.playlist.id,
//                     );

//                     if (updatedplaylist.songs.isEmpty) {
//                       return const Center(
//                         child: Text("Nothing found!"),
//                       );
//                     }
//                     List<SongModelClass> filterSongs = [];
//                     if (filter != null && filter!.isNotEmpty) {
//                       filterSongs = updatedplaylist.songs
//                           .where((e) => e.displayNameWOExt
//                               .toLowerCase()
//                               .contains(filter!.toLowerCase()))
//                           .toList();
//                       filteredsongsListNotifier.value = filterSongs;
//                     } else {
//                       filterSongs = updatedplaylist.songs;
//                       filteredsongsListNotifier.value = filterSongs;
//                     }

//                     return ValueListenableBuilder<List<SongModelClass>>(
//                         valueListenable: filteredsongsListNotifier,
//                         builder: (context, songs, child) {
//                           return ListView.builder(
//                             itemCount: songs.length,
//                             shrinkWrap: true,
//                             itemBuilder: (BuildContext ctx, int newindex) {
//                               final singleSongData = songs[newindex];
//                               return GestureDetector(
//                                 onDoubleTap: () {
//                                   Navigator.of(context).push(
//                                     MaterialPageRoute(
//                                       builder: (ctx) {
//                                         return PlaybackScreen(
//                                             songs: songs, index: newindex);
//                                       },
//                                     ),
//                                   );
//                                 },
//                                 child: PlaylistSongsCard(
//                                     songItem: singleSongData,
//                                     playlistId: widget.playlist.id!),
//                               );
//                             },
//                           );
//                         });
//                   },
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/layout_spacing.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/playback/view/playback_screen.dart';
import 'package:musicme/features/playlist/logic/db_function.dart';
import 'package:musicme/features/playlist/model/playlist_model.dart';
import 'package:musicme/features/playlist/view/playlist_song_card.dart';

class PlaylistSongsScreen extends StatefulWidget {
  final PlaylistModelClass playlist;

  const PlaylistSongsScreen({super.key, required this.playlist});

  @override
  State<PlaylistSongsScreen> createState() => _PlaylistSongsScreenState();
}

class _PlaylistSongsScreenState extends State<PlaylistSongsScreen> {
  final TextEditingController searchController = TextEditingController();
  String? filter;
  ValueNotifier<List<SongModelClass>> filteredSongsListNotifier =
      ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutSpacer.vertical30,
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'What do you want to hear...',
                      contentPadding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    filteredSongsListNotifier.value.shuffle();
                    filteredSongsListNotifier.notifyListeners();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(160, 30),
                  ),
                  icon: const Icon(Icons.shuffle_rounded),
                  label: const Text(
                    'Shuffle Playback',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                Text(
                  widget.playlist.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ValueListenableBuilder<List<PlaylistModelClass>>(
                valueListenable: playlistNotifier,
                builder: (context, newPlaylists, child) {
                  final updatedPlaylist = newPlaylists.firstWhere(
                    (playlist) => playlist.id == widget.playlist.id,
                  );

                  if (updatedPlaylist.songs.isEmpty) {
                    return const Center(
                      child: Text("Nothing found!"),
                    );
                  }

                  List<SongModelClass> filteredSongs;
                  if (filter != null && filter!.isNotEmpty) {
                    filteredSongs = updatedPlaylist.songs
                        .where((song) => song.displayNameWOExt
                            .toLowerCase()
                            .contains(filter!.toLowerCase()))
                        .toList();
                  } else {
                    filteredSongs = updatedPlaylist.songs;
                  }
                  filteredSongsListNotifier.value = filteredSongs;

                  return ValueListenableBuilder<List<SongModelClass>>(
                    valueListenable: filteredSongsListNotifier,
                    builder: (context, songs, child) {
                      return ListView.builder(
                        itemCount: songs.length,
                        itemBuilder: (ctx, index) {
                          final song = songs[index];
                          return GestureDetector(
                            onDoubleTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => PlaybackScreen(
                                    songs: songs,
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            child: PlaylistSongsCard(
                              songItem: song,
                              playlistId: widget.playlist.id!,
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
