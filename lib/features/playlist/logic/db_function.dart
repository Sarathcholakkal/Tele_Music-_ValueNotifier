import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:musicme/common/widgets/toast_message_widget.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
import 'package:musicme/features/playlist/model/playlist_model.dart';

ValueNotifier<List<PlaylistModelClass>> playlistNotifier = ValueNotifier([]);
Future<void> createPlaylist(String name) async {
  final playlistDB = await Hive.openBox<PlaylistModelClass>('playlistBox');
  bool playlistExists =
      playlistDB.values.any((playlist) => playlist.name == name);
  if (playlistExists) {
    showToastMessage('A playlist with this name already exists.');

    return;
  }
  final newPlaylist = PlaylistModelClass(name: name);
  var generatdId = await playlistDB.add(newPlaylist);
  newPlaylist.id = generatdId;
  await playlistDB.put(generatdId, newPlaylist);
  getAllPlaylists();
}

Future<void> getAllPlaylists() async {
  final playlistDB = await Hive.openBox<PlaylistModelClass>('playlistBox');
  playlistNotifier.value.clear();
  playlistNotifier.value.addAll(playlistDB.values);
  playlistNotifier.notifyListeners();
}

Future<void> deletePlaylist(int id) async {
  final playlistDB = await Hive.openBox<PlaylistModelClass>('playlistBox');

  playlistDB.delete(id);
  getAllPlaylists();
  showToastMessage("playlist  deleted");
}

Future<void> removeSongFromPlaylist(
    int playlistid, SongModelClass songItem) async {
  final playlistDB = await Hive.openBox<PlaylistModelClass>('playlistBox');
  final playlist = playlistDB.values.firstWhere(
    (playlist) => playlist.id == playlistid,
  );
  playlist.songs.removeWhere((song) {
    return song.displayNameWOExt == songItem.displayNameWOExt;
  });

  await playlistDB.put(playlist.id, playlist);
  getAllPlaylists();
}

Future<void> addSongsToPlaylist(
    int playlistId, List<SongModelClass> selectedSongs) async {
  final playlistDB = await Hive.openBox<PlaylistModelClass>('playlistBox');

  final playlist = playlistDB.values.firstWhere(
    (playlist) => playlist.id == playlistId,
  );

  List<SongModelClass> updatedSongs = List<SongModelClass>.from(playlist.songs);

  for (SongModelClass song in selectedSongs) {
    if (!updatedSongs.any((s) => s.displayNameWOExt == song.displayNameWOExt)) {
      updatedSongs.add(song);
    } else {
      showToastMessage('${song.displayNameWOExt} already exists.');
    }
  }

  playlist.songs = updatedSongs;

  await playlistDB.put(playlist.id!, playlist);

  getAllPlaylists();
}

//=================

Future<void> renamePlaylist(int playlistId, String newName) async {
  final playlistDB = await Hive.openBox<PlaylistModelClass>('playlistBox');

  // Check if a playlist with the new name already exists
  bool playlistExists =
      playlistDB.values.any((playlist) => playlist.name == newName);
  if (playlistExists) {
    showToastMessage('A playlist with this name already exists.');
    return;
  }

  // Find the playlist to rename
  final playlist = playlistDB.values.firstWhere(
    (playlist) => playlist.id == playlistId,
    // orElse: () => null, // Handle the case if the playlist isn't found
  );

  playlist.name = newName; // Update the name
  await playlistDB.put(playlist.id!, playlist); // Save the updated playlist
  getAllPlaylists(); // Refresh the playlist list
  showToastMessage("Playlist renamed successfully.");

  // if (playlist != null) {
  //   playlist.name = newName; // Update the name
  //   await playlistDB.put(playlist.id!, playlist); // Save the updated playlist
  //   getAllPlaylists(); // Refresh the playlist list
  //   showToastMessage("Playlist renamed successfully.");
  // } else {
  //   showToastMessage("Playlist not found.");
  // }
}
