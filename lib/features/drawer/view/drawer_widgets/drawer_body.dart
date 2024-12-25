import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/helper.dart';
import 'package:musicme/features/drawer/view/drawer_screen/about_us.dart';
import 'package:musicme/features/drawer/view/drawer_screen/privacy_policy_screen.dart';
import 'package:musicme/features/drawer/view/drawer_screen/send_feedback.dart';
import 'package:musicme/features/drawer/view/drawer_widgets/drawer_enum.dart';
import 'package:musicme/features/on_boarding/logic/sharedpref_services.dart';
import 'package:musicme/features/on_boarding/view/on_boarding_login.dart';
import 'package:musicme/features/on_boarding/view/on_boarding_screen.dart';

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
          GestureDetector(
            onTap: () {
              showDialog(
                context: Scaffold.of(context).context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Confirm Logout"),
                    content: const Text("Are you sure you want to log out?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () async {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OnBoardingPage()),
                            (route) => false, // Retains only the first route
                          );
                          await Helper.player.pause();
                          SharedprefServices.clearAll();
                          // Perform logout action
                          // Navigator.of(context).pop();
                        },
                        child: const Text("Logout"),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 38, top: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.logout_outlined,
                    size: 20,
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Logout",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
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
