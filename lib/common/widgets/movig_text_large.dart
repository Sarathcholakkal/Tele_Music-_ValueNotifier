import 'package:flutter/material.dart';
import 'package:marquee_text/marquee_direction.dart';
import 'package:marquee_text/marquee_text.dart';

class MovigTextLarge extends StatelessWidget {
  const MovigTextLarge({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: MarqueeText(
        text: TextSpan(
          text: name,
        ),
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        marqueeDirection:
            MarqueeDirection.ltr, // Enables the bounce-back effect
        speed: 10, // Adjust speed: lower value for slower scrolling
      ),
    );
  }
}
