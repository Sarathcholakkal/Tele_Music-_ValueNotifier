import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/layout_spacing.dart';
import 'package:musicme/common/utils/const/pallets.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "ABOUT US",
              style: TextStyle(
                  fontSize: 20,
                  color: Pallete.logoGreenColor,
                  fontWeight: FontWeight.bold),
            ),
            LayoutSpacer.vertical20,
            buildDescriptionText(
              " we are a passionate team committed to transforming your music listening experience. Our mission is to enhance user interaction by focusing on a minimalist UI that caters to the needs of every music lover. We understand the importance of accessibility, especially for the Indian middle-class audience, which is why we are proud to offer a fully functional application without any subscriptions or ads.",
            ),
            LayoutSpacer.vertical20,
            buildDescriptionText(
                "\u272A Ad-Free Experience: Enjoy your music without the hassle of advertisements."),
            LayoutSpacer.vertical20,
            buildDescriptionText(
                '"\u272A Subscription-Free: Access all features of the app without any hidden fees or subscriptions."'),
            LayoutSpacer.vertical20,
            buildDescriptionText(
                "\u272A User-Centric Design: Our minimalist UI is designed to be intuitive and user-friendly, ensuring that you can easily navigate through your music collection."),
            LayoutSpacer.vertical20,
            buildHeadingText("Sincerely,\nMusicMeTeam"),
            LayoutSpacer.vertical20,
            buildHeadingText("Made with Flutter and Hive"),
          ],
        ),
      ),
    );
  }

  // ! ===============================extacted methods========================================================================================================

  Text buildHeadingText(
    String heading,
  ) {
    return Text(
      heading,
      style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Pallete.logoGreenColor),
      textAlign: TextAlign.center,
    );
  }

  Text buildDescriptionText(
    String description,
  ) {
    return Text(
      description,
      style: const TextStyle(
        fontSize: 16,
      ),
      textAlign: TextAlign.center,
    );
  }
}
