import 'package:flutter/material.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';

class SongDetailsSection extends StatelessWidget {
  final List<SongModelClass> songs;
  final ValueNotifier<int> currentSongIndex;

  const SongDetailsSection(
      {super.key, required this.songs, required this.currentSongIndex});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentSongIndex,
      builder: (context, index, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              width: 280,
              child: Center(
                child: Text(
                  songs[index].displayNameWOExt,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              width: 280,
              height: 20,
              child: Center(
                child: Text(
                  songs[index].artist,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
// ValueListenableBuilder<int>(
//                         valueListenable: currentSongIndex,
//                         builder: (context, index, child) {
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 height: 40,
//                                 width: 280,
//                                 child: Center(
//                                   child: Text(
//                                     widget.songs[index].displayNameWOExt,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: const TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 280,
//                                 height: 20,
//                                 child: Center(
//                                   child: Text(
//                                     widget.songs[index].artist,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           );
//                         },
//                       )