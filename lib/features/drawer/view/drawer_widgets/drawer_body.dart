import 'package:flutter/material.dart';
import 'package:musicme/features/drawer/view/drawer_screen/about_us.dart';
import 'package:musicme/features/drawer/view/drawer_screen/privacy_policy_screen.dart';
import 'package:musicme/features/drawer/view/drawer_screen/send_feedback.dart';
import 'package:musicme/features/drawer/view/drawer_widgets/drawer_enum.dart';

ValueNotifier<DrawerSection> currentPage = ValueNotifier(DrawerSection.none);

class BodyDrawerWidget extends StatefulWidget {
  const BodyDrawerWidget({
    super.key,
  });

  @override
  State<BodyDrawerWidget> createState() => _BodyDrawerWidgetState();
}

class _BodyDrawerWidgetState extends State<BodyDrawerWidget> {
  // var currentPage = DrawerSection.home;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: currentPage,
            builder: (context, DrawerSection value, _) {
              return menuItem(1, 'AboutUs', Icons.info_outlined,
                  value == DrawerSection.aboutus);
            },
          ),
          ValueListenableBuilder(
            valueListenable: currentPage,
            builder: (context, DrawerSection value, _) {
              return menuItem(2, 'PrivacyPolicy', Icons.privacy_tip_outlined,
                  value == DrawerSection.privacyPolicy);
            },
          ),
          ValueListenableBuilder(
            valueListenable: currentPage,
            builder: (context, DrawerSection value, _) {
              return menuItem(3, 'SendFeedback', Icons.feedback_outlined,
                  value == DrawerSection.sendFeedback);
            },
          ),
        ],
      ),
    );
  }

  //!===============menuItem==================================

  Widget menuItem(int id, String tittle, IconData icons, bool selected) {
    return Material(
      color: selected ? Colors.black45 : Colors.transparent,
      child: InkWell(
        onTap: () {
          switch (id) {
            case 1:
              currentPage.value = DrawerSection.aboutus;
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return const AboutUs();
                  },
                ),
              );
              break;
            case 2:
              currentPage.value = DrawerSection.privacyPolicy;
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return const PrivacyPolicyScreen();
                  },
                ),
              );
              break;

            case 3:
              currentPage.value = DrawerSection.sendFeedback;
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return const SendFeedback();
                  },
                ),
              );
              break;
          }
          Future.delayed(const Duration(milliseconds: 300), () {
            currentPage.value = DrawerSection.none;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icons,
                  size: 20,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  tittle,
                  style: const TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
