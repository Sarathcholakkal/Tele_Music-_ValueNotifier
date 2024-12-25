import 'package:flutter/material.dart';

class OnbordingBox extends StatelessWidget {
  final String imagePath;
  final String headline;
  final String description;

  const OnbordingBox(
      {super.key,
      required this.imagePath,
      required this.headline,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          SizedBox(
            height: 600,
            child: Center(
              child: Image.asset(
                imagePath,
              ),
            ),
          ),
          Container(
            height: 180,
            margin: const EdgeInsets.only(top: 500),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  headline,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
