import 'package:flutter/widgets.dart';
import 'package:marquee_text/marquee_direction.dart';
import 'package:marquee_text/marquee_text.dart';

class MovingText extends StatelessWidget {
  const MovingText({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: MarqueeText(
        text: TextSpan(
          text: name,
        ),
        style: const TextStyle(fontSize: 16),
        marqueeDirection:
            MarqueeDirection.ltr, // Enables the bounce-back effect
        speed: 10, // Adjust speed: lower value for slower scrolling
      ),
    );
  }
}
