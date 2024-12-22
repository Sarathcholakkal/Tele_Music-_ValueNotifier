import 'package:flutter/material.dart';
import 'package:musicme/common/utils/const/helper.dart';
import 'package:musicme/features/playback/view/playback_time.dart';

class PlaybackSeekSection extends StatelessWidget {
  final ValueNotifier<Duration> position;
  final ValueNotifier<Duration> duration;

  const PlaybackSeekSection(
      {super.key, required this.position, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<Duration>(
          valueListenable: duration,
          builder: (context, totalDuration, child) {
            return ValueListenableBuilder<Duration>(
              valueListenable: position,
              builder: (context, currentPosition, child) {
                return SeekSlider(
                  position: currentPosition,
                  duration: totalDuration,
                  onChanged: (value) =>
                      Helper.player.seek(Duration(seconds: value.toInt())),
                );
              },
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TimeDisplay(time: formatDuration(position.value)),
              TimeDisplay(time: formatDuration(duration.value)),
            ],
          ),
        ),
      ],
    );
  }

  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}

class SeekSlider extends StatelessWidget {
  final Duration position;
  final Duration duration;
  final ValueChanged<double> onChanged;

  const SeekSlider({
    super.key,
    required this.position,
    required this.duration,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0.0,
      max: duration.inSeconds.toDouble(),
      value: position.inSeconds.clamp(0, duration.inSeconds).toDouble(),
      onChanged: onChanged,
    );
  }
}
