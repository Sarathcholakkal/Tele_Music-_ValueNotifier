import 'package:flutter/material.dart';
import 'package:musicme/common/widgets/moving_text_small.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/recently_played/view/recently_played_artwork.dart';

class RecentlyPlayedCard extends StatelessWidget {
  final SongModelClass singleSong;

  const RecentlyPlayedCard({super.key, required this.singleSong});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecentlyPlayedArtWork(singleSong: singleSong),
          const SizedBox(height: 5),
          MovingTextSmall(name: singleSong.displayNameWOExt),
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
