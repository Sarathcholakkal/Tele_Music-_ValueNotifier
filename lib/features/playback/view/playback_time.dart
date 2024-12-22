import 'package:flutter/material.dart';

class TimeDisplay extends StatelessWidget {
  final String time;

  const TimeDisplay({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Text(
      time,
      style: const TextStyle(fontSize: 16),
    );
  }
}
