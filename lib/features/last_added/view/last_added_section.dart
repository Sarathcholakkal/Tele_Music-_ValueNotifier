import 'package:flutter/material.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/home/view/heading.dart';
import 'package:musicme/features/last_added/logic/last_added_function.dart';
import 'package:musicme/features/last_added/view/last_added_card.dart';
import 'package:musicme/features/last_added/view/last_added_screen.dart';
import 'package:musicme/features/playback/view/playback_screen.dart';

class LastAddedSection extends StatelessWidget {
  const LastAddedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: double.infinity,
      // color: Colors.black,
      child: Column(
        children: [
          Heading(title: "Last Added", screen: () => const LastAddedScreen()),
          SizedBox(
            height: 190,
            child: ValueListenableBuilder<List<SongModelClass>>(
                valueListenable: lastsongsListNotifier,
                builder: (context, songs, child) {
                  var last30songs = songs.take(30).toList();
                  return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int indx) {
                        final singlesong = last30songs[indx];
                        return GestureDetector(
                          onDoubleTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => PlaybackScreen(
                                    songs: last30songs, index: indx),
                              ),
                            );
                          },
                          child: LastAddedCard(singleSong: singlesong),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: last30songs.length);
                }),
          )
        ],
      ),
    );
  }
}
