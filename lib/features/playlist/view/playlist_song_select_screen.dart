import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/layout_spacing.dart';
import 'package:musicme/features/all_songs/logic/db_functions.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/playlist/view/playlist_select_screen.dart';

import 'package:musicme/features/playlist/view/playlist_song_select_card.dart';

class PlaylistSongSelectScreen extends StatefulWidget {
  const PlaylistSongSelectScreen({super.key});

  @override
  State<PlaylistSongSelectScreen> createState() =>
      _PlaylistSongSelectScreenState();
}

class _PlaylistSongSelectScreenState extends State<PlaylistSongSelectScreen> {
  final searchController = TextEditingController();
  bool isAllSelected = false;
  String? filter;
  ValueNotifier<List<bool>> checkBoxValues = ValueNotifier<List<bool>>(
      List.filled(songsListNotifier.value.length, false));
  @override
  void initState() {
    super.initState();
    searchController.addListener(
      () {
        setState(
          () {
            filter = searchController.text;
          },
        );
      },
    );
  }

  List<SongModelClass> getSelectedSongs() {
    List<SongModelClass> selectedsongs = [];
    for (int i = 0; i < songsListNotifier.value.length; i++) {
      if (checkBoxValues.value[i]) {
        selectedsongs.add(songsListNotifier.value[i]);
      }
    }
    return selectedsongs;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        body: Container(
          margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
          // color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LayoutSpacer.vertical30,
              TextFormField(
                keyboardType: TextInputType.text,
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'find your song from here...',
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
                // color: Colors.amber,
                child: Row(
                  children: [
                    Checkbox(
                        value: isAllSelected,
                        tristate: true,
                        onChanged: (newvalue) {
                          isAllSelected = newvalue ?? false;
                        }),
                    const Text("Select All"),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          var selectedSongs = getSelectedSongs();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (ctx) => PlaylistSelectScreen(
                                  selectedSongs: selectedSongs),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.playlist_add,
                          size: 30,
                        ))
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
                      } else {
                        filterSongs = songs;
                      }

                      return ListView.builder(
                        itemCount: filterSongs.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext ctx, int newindex) {
                          final singleSongData = filterSongs[newindex];
                          return ValueListenableBuilder<List<bool>>(
                              valueListenable: checkBoxValues,
                              builder:
                                  (BuildContext ctx, List<bool> boxValues, _) {
                                bool boxValue = boxValues[newindex];
                                return PlaylistSongSelectCard(
                                    songItem: singleSongData,
                                    boxValue: boxValue,
                                    checkBoxValues: checkBoxValues,
                                    indx: newindex);
                              });
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
