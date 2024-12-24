import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:musicme/common/utils/const/helper.dart';
import 'package:musicme/features/all_songs/logic/fetch_function.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:uuid/uuid.dart';

Future<List<SongModel>> fetchlastSongs() async {
  final fetchedSongs = await Helper.query.querySongs(
    sortType: SongSortType.DATE_ADDED,
    orderType: OrderType.DESC_OR_GREATER,
  );

  return fetchedSongs;
}

ValueNotifier<List<SongModelClass>> lastsongsListNotifier = ValueNotifier([]);

Future<void> storelastSongs() async {
  final songs = await filterSongs(fetchlastSongs());
  const uuid = Uuid();
  // print(songs);
  final lastsongsDB = await Hive.openBox<SongModelClass>('lastsongsBox');

  for (var song in songs) {
    var uniqueId = uuid.v4();

    if (!lastsongsDB.values.any((s) => s.id == song.id)) {
      await lastsongsDB.put(
        uniqueId,
        SongModelClass(
          id: song.id,
          songid: song.id,
          displayNameWOExt: song.displayNameWOExt,
          artist: song.artist ?? "Unknown Artist",
          uri: song.uri,
        ),
      );
    }
  }

  getlastSongs();
}

Future<void> getlastSongs() async {
  final lastsongsDB = await Hive.openBox<SongModelClass>('lastsongsBox');
  lastsongsListNotifier.value.clear();
  lastsongsListNotifier.value.addAll(lastsongsDB.values);
  lastsongsListNotifier.notifyListeners();
}
