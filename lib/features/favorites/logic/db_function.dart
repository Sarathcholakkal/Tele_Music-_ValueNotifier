import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:musicme/common/widgets/toast_message_widget.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';

ValueNotifier<List<SongModelClass>> favoriteListNotifier = ValueNotifier([]);

Future<void> storeFavoriteSongs(SongModelClass song) async {
  final songsfavDB = await Hive.openBox<SongModelClass>('favoritesongsBox');
  if (!songsfavDB.values.any((s) => s.songid == song.songid)) {
    await songsfavDB.put(
      song.id,
      SongModelClass(
        id: song.id,
        songid: song.songid,
        displayNameWOExt: song.displayNameWOExt,
        artist: song.artist,
        uri: song.uri,
      ),
    );
  } else {
    showToastMessage("song already exits");
  }

  getFavSongs();
  showToastMessage("song added to favorites");
}

Future<void> getFavSongs() async {
  final songsfavDB = await Hive.openBox<SongModelClass>('favoritesongsBox');
  favoriteListNotifier.value.clear();
  favoriteListNotifier.value.addAll(songsfavDB.values);
  favoriteListNotifier.notifyListeners();
}

Future<void> removeFavoriteSongs(dynamic key) async {
  final songsfavDB = await Hive.openBox<SongModelClass>('favoritesongsBox');

  await songsfavDB.delete(key);
  getFavSongs();
  showToastMessage("song remove from favorites");
}

Future<void> shuffleFavoriteSongs() async {
  favoriteListNotifier.value.shuffle(Random());
  favoriteListNotifier.notifyListeners();
}
