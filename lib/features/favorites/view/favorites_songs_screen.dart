import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/layout_spacing.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/all_songs/view/all_song_card.dart';
import 'package:musicme/features/favorites/logic/db_function.dart';
import 'package:musicme/features/playback/view/playback_screen.dart';

class FavoriteSongsScreen extends StatefulWidget {
  const FavoriteSongsScreen({super.key});

  @override
  State<FavoriteSongsScreen> createState() => _FavoriteSongsScreenState();
}

class _FavoriteSongsScreenState extends State<FavoriteSongsScreen> {
  final searchController = TextEditingController();
  String? filter;
  ValueNotifier<List<SongModelClass>> filteredsongsListNotifier =
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
    return FutureBuilder<void>(
      future: getFavSongs(), // Load the data initially
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else {
          // Use ValueListenableBuilder to update the UI dynamically
          return ValueListenableBuilder<List<SongModelClass>>(
            valueListenable: favoriteListNotifier,
            builder: (context, songs, _) {
              if (songs.isEmpty) {
                return const Center(child: Text("No favorite songs found."));
              } else {
                return Container(
                  margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LayoutSpacer.vertical30,
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: searchController,
                        decoration: const InputDecoration(
                          hintText: 'What do you want to hear...',
                          contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                          filled: true,
                          // Optional: background color
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  12), // Adjust the radius as needed
                            ),
                            borderSide:
                                BorderSide.none, // Removes the border line
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                // shuffleSongs();
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(160, 30),
                              ),
                              icon: const Icon(Icons.shuffle_rounded),
                              label: const Text(
                                'Shuffles Playback',
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                            const SizedBox(
                              child: Text(
                                "FavoiteSongs",
                                style: TextStyle(
                                  color: Color(0xFF5B5A5F),
                                  fontSize: 19,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: ValueListenableBuilder<List<SongModelClass>>(
                            valueListenable: favoriteListNotifier,
                            builder: (context, songs, child) {
                              if (songs.isEmpty) {
                                return const Center(
                                    child: Text("Nothing found!"));
                              }
                              List<SongModelClass> filterSongs = [];
                              if (filter != null && filter!.isNotEmpty) {
                                filterSongs = songs
                                    .where((e) => e.displayNameWOExt
                                        .toLowerCase()
                                        .contains(filter!.toLowerCase()))
                                    .toList();
                                filteredsongsListNotifier.value = filterSongs;
                              } else {
                                filterSongs = songs;
                                filteredsongsListNotifier.value = filterSongs;
                              }

                              return ValueListenableBuilder<
                                  List<SongModelClass>>(
                                valueListenable: filteredsongsListNotifier,
                                builder: (context, filteredSongs, child) {
                                  return ListView.builder(
                                    itemCount: filteredSongs.length,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext ctx, int filterdindex) {
                                      final singleSongData =
                                          filteredSongs[filterdindex];
                                      return GestureDetector(
                                        onDoubleTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (ctx) {
                                                return PlaybackScreen(
                                                    songs: filteredSongs,
                                                    index: filterdindex);
                                              },
                                            ),
                                          );
                                        },
                                        child: ListSongCard(
                                            songItem: singleSongData),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
            },
          );
        }
      },
    );
  }
}
