import 'package:flutter/material.dart';
import 'package:musicme/features/home/view/heading.dart';
import 'package:musicme/features/last_added/view/last_added_card.dart';
import 'package:musicme/features/last_added/view/last_added_screen.dart';
import 'package:musicme/features/recently_played/view/recnetly_played_screen.dart';

class LastAddedSection extends StatelessWidget {
  const LastAddedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      // color: Colors.black,
      child: Column(
        children: [
          Heading(title: "Last Added", screen: () => LastAddedScreen()),
          Container(
            height: 190,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return LastAddedCard();
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
