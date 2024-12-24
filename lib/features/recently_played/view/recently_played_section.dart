import 'package:flutter/material.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/frequently_played/logic/frequently_played_functions.dart';
import 'package:musicme/features/frequently_played/view/frequently_played_card.dart';
import 'package:musicme/features/home/view/heading.dart';
import 'package:musicme/features/playback/view/playback_screen.dart';
import 'package:musicme/features/recently_played/logic/recently_played_functions.dart';
import 'package:musicme/features/recently_played/view/recently_played_card.dart';
import 'package:musicme/features/recently_played/view/recnetly_played_screen.dart';

class RecentlyPlayedSection extends StatelessWidget {
  const RecentlyPlayedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      // color: Colors.black,
      child: Column(
        children: [
          Heading(
              title: "Recently Played", screen: () => RecnetlyPlayedScreen()),
          Container(
            height: 160,
            child: ValueListenableBuilder<List<SongModelClass>>(
                valueListenable: recentlyPlayedNotifer,
                builder: (BuildContext context, List<SongModelClass> songs, _) {
                  var recently30songs = songs.take(30).toList();
                  return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int indx) {
                        final singleSong = recently30songs[indx];
                        return GestureDetector(
                          onDoubleTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) {
                                  return PlaybackScreen(
                                      songs: recently30songs, index: indx);
                                },
                              ),
                            );
                          },
                          child: RecentlyPlayedCard(singleSong: singleSong),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: recently30songs.length);
                }),
          )
        ],
      ),
    );
  }
}
