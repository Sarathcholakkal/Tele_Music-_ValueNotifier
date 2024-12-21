import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/layout_spacing.dart';
import 'package:musicme/common/utils/const/pallets.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double dynamicFontSize04 = MediaQuery.of(context).size.width * 0.040;
    double dynamicFontSize045 = MediaQuery.of(context).size.width * 0.045;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: buildTitle2(context),
                  ),
                  buildDescriptionText2(
                      context: context,
                      description:
                          "These terms and conditions outline the rules and regulations for the use of MusicMe Music Player. By using this app, we assume you accept these terms and conditions. Do not continue to use MusicMe Music Player if you do not agree to take all of the terms and conditions stated on this page.",
                      fontSize: dynamicFontSize04),
                  LayoutSpacer.vertical16,
                  buildDescriptionText2(
                      context: context,
                      description:
                          "The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements:",
                      fontSize: dynamicFontSize04),
                  LayoutSpacer.vertical16,
                  buildDescriptionText2(
                      context: context,
                      description:
                          '• "Client", "You" and "Your" refers to you, the person who logs on this website and complies with the Company’s terms and conditions.',
                      fontSize: dynamicFontSize04),
                  LayoutSpacer.vertical16,
                  buildDescriptionText2(
                      context: context,
                      description:
                          '• "The Company", "Ourselves", "We", "Our" and "Us" refers to our Company.',
                      fontSize: dynamicFontSize04),
                  LayoutSpacer.vertical16,
                  buildDescriptionText2(
                      context: context,
                      description:
                          '• "Party", "Parties", or "Us" refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of india.',
                      fontSize: dynamicFontSize04),
                  LayoutSpacer.vertical16,
                  buildDescriptionText2(
                      context: context,
                      description: 'License',
                      fontSize: dynamicFontSize045),
                  LayoutSpacer.vertical8,
                  buildDescriptionText2(
                      context: context,
                      description:
                          'Unless otherwise stated, MusicMe Music Player and/or its licensors own the intellectual property rights for all material on Moz Music Player. All intellectual property rights are reserved. You may access this from MusicMe Music Player for your own personal use subjected to restrictions set in these terms and conditions.',
                      fontSize: dynamicFontSize04),
                  LayoutSpacer.vertical16,
                  buildDescriptionText2(
                      context: context,
                      description: 'You must not:',
                      fontSize: dynamicFontSize045),
                  LayoutSpacer.vertical8,
                  buildDescriptionText2(
                      context: context,
                      description:
                          '• Republish material from MusicMe Music Player',
                      fontSize: dynamicFontSize045),
                  LayoutSpacer.vertical8,
                  buildDescriptionText2(
                      context: context,
                      description:
                          '• Sell, rent, or sub-license material from MusicMe Music Player',
                      fontSize: dynamicFontSize04),
                  LayoutSpacer.vertical8,
                  buildDescriptionText2(
                      context: context,
                      description:
                          '• Sell, rent, or sub-license material from MusicMe Music Player',
                      fontSize: dynamicFontSize04),
                  LayoutSpacer.vertical8,
                  buildDescriptionText2(
                      context: context,
                      description:
                          '• Reproduce, duplicate, or copy material from MusicMe Music Player',
                      fontSize: dynamicFontSize04),
                  LayoutSpacer.vertical8,
                  buildDescriptionText2(
                      context: context,
                      description: '• Redistribute content',
                      fontSize: dynamicFontSize04),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //!===================================extracted  methods============================

  Text buildDescriptionText2(
      {required BuildContext context,
      required String description,
      required double fontSize}) {
    return Text(description
        // style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        //       fontSize: fontSize,
        //     )
        );
  }
}

Text buildTitle2(BuildContext context) {
  return Text(
    'Privacy Policy',
    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontSize: MediaQuery.of(context).size.width * 0.05,
        fontWeight: FontWeight.bold,
        color: Pallete.logoGreenColor),
  );
}
