import 'package:flutter/widgets.dart';
import 'package:musicme/common/utils/const/pallets.dart';

class PlaylistTittle extends StatelessWidget {
  const PlaylistTittle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Playlists',
      style: TextStyle(
        fontFamily: 'inter',
        fontSize: 32,
        letterSpacing: -.32,
        color: Pallete.whiteColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
