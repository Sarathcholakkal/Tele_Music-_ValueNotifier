import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/layout_spacing.dart';
import 'package:musicme/features/all_songs/logic/db_functions.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/all_songs/view/all_song_card.dart';
import 'package:musicme/features/playback/view/playback_screen.dart';

class AllSongsScreen extends StatefulWidget {
  const AllSongsScreen({super.key});

  @override
  State<AllSongsScreen> createState() => _AllSongsScreenState();
}

class _AllSongsScreenState extends State<AllSongsScreen> {
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
  void dispose() {
    searchController.dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
        // color: Colors.red,
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
                    Radius.circular(12), // Adjust the radius as needed
                  ),
                  borderSide: BorderSide.none, // Removes the border line
                ),
              ),
            ),
            SizedBox(
              height: 40,
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      shuffleSongs();
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
                      "Allsongs",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ValueListenableBuilder<List<SongModelClass>>(
                  valueListenable: songsListNotifier,
                  builder: (context, songs, child) {
                    if (songs.isEmpty) {
                      return const Center(child: Text("Nothing found!"));
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

                    return ValueListenableBuilder<List<SongModelClass>>(
                        valueListenable: filteredsongsListNotifier,
                        builder: (context, filteredSongs, child) {
                          return ListView.builder(
                            itemCount: filteredSongs.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext ctx, int filterdindex) {
                              final singleSongData = filterSongs[filterdindex];
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
                                child: ListSongCard(songItem: singleSongData),
                              );
                            },
                          );
                        });
                  },
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
