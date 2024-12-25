import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/layout_spacing.dart';
import 'package:musicme/common/widgets/artist_text_widget.dart';
import 'package:musicme/common/widgets/moving_text.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/frequently_played/view/frequnetly_playd_artwork.dart';

class FrequentlyCard extends StatelessWidget {
  final SongModelClass singleSong;

  const FrequentlyCard({super.key, required this.singleSong});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FrequentlyPlayedArtwork(singleSong: singleSong),
          LayoutSpacer.vertical5,
          MovingText(name: singleSong.displayNameWOExt),
          ArtistTextWidget(singleSong: singleSong),
        ],
      ),
    );
  }
}
