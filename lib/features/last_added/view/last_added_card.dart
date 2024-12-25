import 'package:flutter/material.dart';
import 'package:musicme/common/widgets/moving_text.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/last_added/view/last_added_artwork.dart';

class LastAddedCard extends StatelessWidget {
  final SongModelClass singleSong;

  const LastAddedCard({super.key, required this.singleSong});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LastAddedArtWork(singleSong: singleSong),
          const SizedBox(height: 5),
          MovingText(name: singleSong.displayNameWOExt),
          Text(
            singleSong.artist,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
