import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';

ValueNotifier<List<SongModelClass>> frequentlyListNotifier = ValueNotifier([]);

Future<void> incrementPlayCount(SongModelClass song) async {
  final songsDB = await Hive.openBox<SongModelClass>('songsBox');

  var existingSong = songsDB.values
      .firstWhere((s) => s.displayNameWOExt == song.displayNameWOExt);
  existingSong.playCount = (existingSong.playCount ?? 0) + 1;

  await songsDB.put(song.key, existingSong);

  fetchFrequentlyPlayedSongs();
}

Future<void> fetchFrequentlyPlayedSongs() async {
  final frequentSongsDB = await Hive.openBox<SongModelClass>('songsBox');
  final songs = frequentSongsDB.values.toList();

  songs.sort((a, b) {
    int aCount = a.playCount ?? 0;
    int bCount = b.playCount ?? 0;
    return bCount.compareTo(aCount);
  });

  final frequetlyplayedsongs = songs.take(30).toList();
  frequentlyListNotifier.value.clear();
  frequentlyListNotifier.value.addAll(frequetlyplayedsongs);
  frequentlyListNotifier.notifyListeners();
}
