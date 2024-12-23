import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:musicme/common/utils/const/helper.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/favorites/logic/db_function.dart';
import 'package:musicme/features/playback/logic/favorite_checker.dart';
import 'package:musicme/features/playback/view/playback_appbar.dart';
import 'package:musicme/features/playback/view/playback_artwork.dart';
import 'package:musicme/features/playback/view/playback_slide.dart';
import 'package:musicme/features/playback/view/playback_songdetails.dart';
import 'package:musicme/features/playback/view/playback_time.dart';

class PlaybackScreen extends StatefulWidget {
  final List<SongModelClass> songs;
  final int index;

  const PlaybackScreen({super.key, required this.songs, required this.index});

  @override
  State<PlaybackScreen> createState() => _PlaybackScreenState();
}

class _PlaybackScreenState extends State<PlaybackScreen> {
  final ValueNotifier<Duration> position = ValueNotifier(Duration.zero);
  final ValueNotifier<Duration> duration = ValueNotifier(Duration.zero);
  final ValueNotifier<bool> isPlaying = ValueNotifier(false);
  final ValueNotifier<int> currentSongIndex = ValueNotifier(0);
  final ValueNotifier<int> _modeNotifier = ValueNotifier<int>(0);
  final List<LoopMode> _modes = [LoopMode.off, LoopMode.one, LoopMode.all];
  final List<IconData> _icons = [
    Icons.cancel,
    Icons.repeat_one,
    Icons.repeat,
  ];

  final ValueNotifier<bool> _isShaffleEnabled = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isFavorite = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    _playSongs(widget.songs);

    Helper.player.positionStream.listen((p) {
      position.value = p;
    });

    Helper.player.durationStream.listen((d) {
      if (d != null) duration.value = d;
    });

    Helper.player.playerStateStream.listen((state) {
      isPlaying.value = state.playing;
    });

    Helper.player.currentIndexStream.listen((index) {
      if (index != null) {
        currentSongIndex.value = index;

        //? used for update playing time
        if (index < widget.songs.length) {
          final currentSong = widget.songs[index];
          _updateFavoriteStatus();
          // updateRecentlytPlayed(currentSong);
          // incrementPlayCount(currentSong);
        }
      }
    });
  }

  //===========================================================================init state ends

  Future<void> _updateFavoriteStatus() async {
    if (currentSongIndex.value < widget.songs.length) {
      final currentSong = widget.songs[currentSongIndex.value];
      final isFavorite = await checkFavorite(currentSong);
      _isFavorite.value = isFavorite;
    }
  }

  //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

  Future<void> _playSongs(List<SongModelClass> songs) async {
    final playlist = ConcatenatingAudioSource(
      children: songs.map((song) {
        return AudioSource.uri(
          Uri.parse(song.uri!),
          tag: MediaItem(
            // Specify a unique ID for each media item:
            id: song.id.toString(),
            // Metadata to display in the notification:
            album: song.artist ?? "no artist",
            title: song.displayNameWOExt ?? "unknown",
          ),
        );
      }).toList(),
    );
    await Helper.player.setAudioSource(playlist, initialIndex: widget.index);
    Helper.player.play();
  }

//============================================================================functions ends here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //app bar
                const Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 30),
                  child: PlaybackAppBar(),
                ),

                ValueListenableBuilder<int>(
                  valueListenable: currentSongIndex,
                  builder: (context, index, child) {
                    return ArtworkDisplay(currentSong: widget.songs[index]);
                  },
                ),

                // song and artist name
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      SongDetailsSection(
                          songs: widget.songs,
                          currentSongIndex: currentSongIndex),
                      const Spacer(),
                    ],
                  ),
                ),

                ValueListenableBuilder<Duration>(
                  valueListenable: duration,
                  builder: (context, totalDuration, child) {
                    return ValueListenableBuilder<Duration>(
                      valueListenable: position,
                      builder: (context, currentPosition, child) {
                        return SeekSlider(
                          position: currentPosition,
                          duration: totalDuration,
                          onChanged: (value) => Helper.player
                              .seek(Duration(seconds: value.toInt())),
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
                      ValueListenableBuilder<Duration>(
                        valueListenable: position,
                        builder: (context, value, child) {
                          return TimeDisplay(time: formatDuration(value));
                        },
                      ),
                      ValueListenableBuilder<Duration>(
                        valueListenable: duration,
                        builder: (context, value, child) {
                          return TimeDisplay(time: formatDuration(value));
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 35, right: 35, top: 25, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.playlist_add),
                      ),
                      IconButton(
                        onPressed: () async {
                          // Toggle favorite status.
                          _isFavorite.value = !_isFavorite.value;

                          final currentSong =
                              widget.songs[currentSongIndex.value];

                          if (_isFavorite.value) {
                            storeFavoriteSongs(currentSong);
                          } else {
                            removeFavoriteSongs(currentSong.key);
                          }
                        },
                        icon: ValueListenableBuilder<bool>(
                          valueListenable: _isFavorite,
                          builder: (context, isenbled, _) {
                            return Icon(
                              isenbled ? Icons.favorite : Icons.favorite_border,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: isPlaying,
                  builder: (context, playing, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              _isShaffleEnabled.value =
                                  !_isShaffleEnabled.value;
                              Helper.player.setShuffleModeEnabled(
                                  _isShaffleEnabled.value);
                            },
                            icon: ValueListenableBuilder<bool>(
                              valueListenable: _isShaffleEnabled,
                              builder: (context, isenbled, _) {
                                return Icon(
                                  isenbled
                                      ? Icons.shuffle
                                      : Icons.shuffle_on_rounded,
                                );
                              },
                            )),
                        IconButton(
                            onPressed: () {
                              Helper.player.seekToPrevious();
                            },
                            icon: const Icon(Icons.skip_previous_outlined)),
                        Container(
                          width: 75,
                          height: 75,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF6156E2),
                          ),
                          child: IconButton(
                            onPressed: () => playing
                                ? Helper.player.pause()
                                : Helper.player.play(),
                            icon: Icon(
                              playing ? Icons.pause : Icons.play_arrow,
                              size: 35,
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Helper.player.seekToNext();
                            },
                            icon: const Icon(Icons.skip_next_outlined)),
                        IconButton(
                          onPressed: () {
                            _modeNotifier.value =
                                (_modeNotifier.value + 1) % _modes.length;
                            Helper.player
                                .setLoopMode(_modes[_modeNotifier.value]);
                          },
                          icon: ValueListenableBuilder<int>(
                            valueListenable: _modeNotifier,
                            builder: (context, mode, _) {
                              return Icon(
                                _icons[mode],
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}
