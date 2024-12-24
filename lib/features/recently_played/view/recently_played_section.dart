import 'package:flutter/material.dart';
import 'package:musicme/features/frequently_played/view/frequently_played_card.dart';
import 'package:musicme/features/home/view/heading.dart';
import 'package:musicme/features/recently_played/view/recently_played_card.dart';
import 'package:musicme/features/recently_played/view/recnetly_played_screen.dart';

class RecentlyPlayedSection extends StatelessWidget {
  const RecentlyPlayedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      // color: Colors.black,
      child: Column(
        children: [
          Heading(
              title: "Recently Played", screen: () => RecnetlyPlayedScreen()),
          Container(
            height: 160,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return RecentlyPlayedCard();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: 10),
          )
        ],
      ),
    );
  }
}
