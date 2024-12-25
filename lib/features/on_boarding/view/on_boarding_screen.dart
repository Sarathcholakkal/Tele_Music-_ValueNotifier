import 'package:flutter/material.dart';
import 'package:musicme/features/home/view/bottom_nav.dart';
import 'package:musicme/features/on_boarding/logic/sharedpref_services.dart';
import 'package:musicme/features/on_boarding/view/on_boarding_login.dart';
import 'package:musicme/features/on_boarding/view/onboarding_box.dart';
import 'package:musicme/features/on_boarding/view/onboarding_form.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  bool islastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: islastPage
          ? Container(
              margin: const EdgeInsets.only(bottom: 40),
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextButton(
                onPressed: () {
                  if (signInKey.currentState!.validate()) {
                    setValueInSharedprfs();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const BottomNav(),
                      ),
                    );
                  } else {
                    debugPrint("form not vlidated");
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF919199),
                  foregroundColor: Colors.white,

                  padding: const EdgeInsets.symmetric(
                      horizontal: 140,
                      vertical: 14), // Padding inside the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                ),
                child: const Text(
                  "GetStarted",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          : Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        _pageController.jumpToPage(2);
                      },
                      child: const Text("skip")),
                  SmoothPageIndicator(
                      controller: _pageController, // PageController
                      count: 3,
                      effect: const WormEffect(
                          spacing: 16,
                          dotColor: Colors.grey,
                          dotHeight: 6,
                          dotWidth: 30), // your preferred effect
                      onDotClicked: (index) {
                        _pageController.animateToPage(index,
                            duration: const Duration(microseconds: 300),
                            curve: Curves.bounceIn);
                      }),
                  TextButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: const Duration(microseconds: 400),
                          curve: Curves.bounceOut);
                    },
                    child: const Icon(Icons.arrow_forward_ios_outlined),
                  )
                ],
              ),
            ),
      body: Container(
        color: Colors.white,
        // padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(
              () {
                islastPage = index == 2;
              },
            );
          },
          children: const [
            OnbordingBox(
                imagePath: 'assets/vector/vector1.png',
                headline: "Ad-Free Experience",
                description:
                    "Enjoy your music without the hassle of advertisements.Access all features of the app without any hidden fees or subscriptions."),
            OnbordingBox(
                imagePath: 'assets/vector/vector2.png',
                headline: "User-Centric Design",
                description:
                    "Our minimalist UI is designed to be intuitive and user-friendly, ensuring that you can easily navigate through your music collection."),
            OnBoardingLogin(
              imagePath: 'assets/vector/vector3.png',
            )
          ],
        ),
      ),
    );
  }

  Future<void> setValueInSharedprfs() async {
    final name = nameController.text.trim();
    SharedprefServices.saveName(name);
  }
}
