import 'package:flutter/material.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/frequently_played/logic/frequently_played_functions.dart';
import 'package:musicme/features/frequently_played/view/frequently_played_card.dart';
import 'package:musicme/features/frequently_played/view/frequently_played_screen.dart';
import 'package:musicme/features/home/view/heading.dart';
import 'package:musicme/features/playback/view/playback_screen.dart';

class FrequentlyPlayedSection extends StatelessWidget {
  const FrequentlyPlayedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      // color: Colors.black,
      child: Column(
        children: [
          Heading(
              title: "Frequently Played",
              screen: () => const FrequentlyPlayedScreen()),
          SizedBox(
            height: 260,
            child: ValueListenableBuilder<List<SongModelClass>>(
                valueListenable: frequentlyListNotifier,
                builder: (BuildContext context,
                    List<SongModelClass> frequentsongs, _) {
                  return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int indx) {
                        final singleSong = frequentsongs[indx];
                        return GestureDetector(
                            onDoubleTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => PlaybackScreen(
                                      songs: frequentsongs, index: indx)));
                            },
                            child: FrequentlyCard(singleSong: singleSong));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: frequentsongs.length);
                }),
          )
        ],
      ),
    );
  }
}
