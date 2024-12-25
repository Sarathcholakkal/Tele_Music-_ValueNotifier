import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';

ValueNotifier<List<SongModelClass>> recentlyPlayedNotifer = ValueNotifier([]);

Future<void> updateRecentlytPlayed(SongModelClass song) async {
  final recentlyPlayedDB =
      await Hive.openBox<SongModelClass>('recentlyplayedsongsBox');

  if (recentlyPlayedDB.containsKey(song.key)) {
    final existingSong = recentlyPlayedDB.get(song.key);
    await recentlyPlayedDB.put(
      song.key,
      SongModelClass(
        id: existingSong!.id,
        songid: song.songid,
        displayNameWOExt: existingSong.displayNameWOExt,
        artist: existingSong.artist,
        uri: existingSong.uri,
        recentlyPlayed: DateTime.now(),
      ),
    );
  } else {
    await recentlyPlayedDB.put(
      song.key,
      SongModelClass(
        id: song.id,
        songid: song.songid,
        displayNameWOExt: song.displayNameWOExt,
        artist: song.artist,
        uri: song.uri,
        recentlyPlayed: DateTime.now(),
      ),
    );
  }

  await fetchRecentlyPlayedSongs();
}

Future<void> fetchRecentlyPlayedSongs() async {
  final recentlyPlayedDB =
      await Hive.openBox<SongModelClass>('recentlyplayedsongsBox');
  final songs = recentlyPlayedDB.values.toList();

  songs.sort((a, b) {
    final dateA = a.recentlyPlayed ?? DateTime.fromMillisecondsSinceEpoch(0);
    final dateB = b.recentlyPlayed ?? DateTime.fromMillisecondsSinceEpoch(0);
    return dateB.compareTo(dateA);
  });

  recentlyPlayedNotifer.value.clear();
  recentlyPlayedNotifer.value.addAll(songs);
  recentlyPlayedNotifer.notifyListeners();
}
