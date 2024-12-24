import 'package:flutter/material.dart';
import 'package:musicme/features/playlist/model/playlist_model.dart';
import 'package:musicme/features/playlist/view/pop_widgets/playlist_menu_button.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({
    super.key,
    required this.playlist,
  });

  final PlaylistModelClass playlist;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 80,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              playlist.name,
              // playlist.playlist,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            PlaylistMenuButton(playlist: playlist)
          ],
        ),
      ),
    );
  }
}
