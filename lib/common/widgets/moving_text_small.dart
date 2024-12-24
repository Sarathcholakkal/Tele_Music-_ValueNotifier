import 'package:flutter/material.dart';
import 'package:marquee_text/marquee_direction.dart';
import 'package:marquee_text/marquee_text.dart';

class MovingTextSmall extends StatelessWidget {
  const MovingTextSmall({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: MarqueeText(
        text: TextSpan(
          text: name,
        ),
        style: const TextStyle(fontSize: 14),
        marqueeDirection:
            MarqueeDirection.ltr, // Enables the bounce-back effect
        speed: 10, // Adjust speed: lower value for slower scrolling
      ),
    );
  }
}
