import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/pallets.dart';

class PlaybackAppBar extends StatelessWidget {
  const PlaybackAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 25),
        ),
        const SizedBox(
          width: 80,
        ),
        const Text(
          'Now Playing',
          style: TextStyle(fontSize: 18, color: Pallete.logoGreenColor),
        ),
        const Spacer(),
      ],
    );
  }
}
