import 'package:flutter/material.dart';
import 'package:musicme/features/frequently_played/view/frequently_played_card.dart';
import 'package:musicme/features/frequently_played/view/frequently_played_screen.dart';
import 'package:musicme/features/home/view/heading.dart';

class FrequentlyPlayedSection extends StatelessWidget {
  const FrequentlyPlayedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      // color: Colors.black,
      child: Column(
        children: [
          Heading(
              title: "Frequently Played",
              screen: () => FrequentlyPlayedScreen()),
          Container(
            height: 260,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return FrequentlyCard();
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
