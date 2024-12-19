import 'package:flutter/material.dart';
import 'package:musicme/features/on_boarding/view/onboarding_form.dart';

class OnBoardingLogin extends StatelessWidget {
  final String imagePath;

  const OnBoardingLogin({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 600,
              child: Center(
                child: Image.asset(
                  imagePath,
                ),
              ),
            ),
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
