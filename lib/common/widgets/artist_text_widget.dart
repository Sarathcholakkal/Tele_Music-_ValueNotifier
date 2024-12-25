import 'package:flutter/material.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';

class ArtistTextWidget extends StatelessWidget {
  const ArtistTextWidget({
    super.key,
    required this.singleSong,
  });

  final SongModelClass singleSong;

  @override
  Widget build(BuildContext context) {
    return Text(
      singleSong.artist,
      style: const TextStyle(fontSize: 12, color: Colors.grey),
      overflow: TextOverflow.ellipsis,
    );
  }
}
