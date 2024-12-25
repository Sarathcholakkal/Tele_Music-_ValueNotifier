import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/layout_spacing.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/all_songs/view/all_song_card.dart';
import 'package:musicme/features/frequently_played/logic/frequently_played_functions.dart';
import 'package:musicme/features/playback/view/playback_screen.dart';

class FrequentlyPlayedScreen extends StatefulWidget {
  const FrequentlyPlayedScreen({super.key});

  @override
  State<FrequentlyPlayedScreen> createState() => _FrequentlyPlayedScreen();
}

class _FrequentlyPlayedScreen extends State<FrequentlyPlayedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 0, left: 10, right: 10),
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutSpacer.vertical30,
            SizedBox(
              height: 40,
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                  const SizedBox(
                    child: Text(
                      "Frequently Played Songs",
                      style: TextStyle(
                        color: Color(0xFF5B5A5F),
                        fontSize: 19,
                      ),
                    ),
                  ),
                  const Spacer()
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ValueListenableBuilder<List<SongModelClass>>(
                  valueListenable: frequentlyListNotifier,
                  builder: (context, songs, child) {
                    if (songs.isEmpty) {
                      return const Center(child: Text("Nothing found!"));
                    }

                    return ListView.builder(
                      itemCount: songs.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext ctx, int newindex) {
                        final singleSongData = songs[newindex];
                        return GestureDetector(
                          onDoubleTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) {
                                  return PlaybackScreen(
                                      songs: songs, index: newindex);
                                },
                              ),
                            );
                          },
                          child: ListSongCard(songItem: singleSongData),
                        );
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
  }
}
