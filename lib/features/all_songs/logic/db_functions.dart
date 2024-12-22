import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:musicme/features/all_songs/logic/fetch_function.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';

ValueNotifier<List<SongModelClass>> songsListNotifier = ValueNotifier([]);

Future<void> storeSongs() async {
  final songs = await filterSongs(fetchSongs());

  final songsDB = await Hive.openBox<SongModelClass>('songsBox');

  for (var song in songs) {
    if (!songsDB.values.any((s) => s.songid == song.id)) {
      var generatedKey = await songsDB.add(
        SongModelClass(
          songid: song.id,
          displayNameWOExt: song.displayNameWOExt,
          artist: song.artist ?? "Unknown Artist",
          uri: song.uri,
        ),
      );

      //? add generated key to same object
      SongModelClass updatedSong = SongModelClass(
        id: generatedKey,
        songid: song.id,
        displayNameWOExt: song.displayNameWOExt,
        artist: song.artist ?? "Unknown Artist",
        uri: song.uri,
      );

      // Put the updated song back into the database
      await songsDB.put(generatedKey, updatedSong);
    }
  }

  getSongs();
}

Future<void> getSongs() async {
  final songsDB = await Hive.openBox<SongModelClass>('songsBox');
  songsListNotifier.value.clear();
  songsListNotifier.value.addAll(songsDB.values);
  songsListNotifier.notifyListeners();
}

Future<void> shuffleSongs() async {
  songsListNotifier.value.shuffle(Random());
  songsListNotifier.notifyListeners();
}
