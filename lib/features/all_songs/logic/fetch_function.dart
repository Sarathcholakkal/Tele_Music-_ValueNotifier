import 'package:musicme/common/utils/const/helper.dart';
import 'package:on_audio_query/on_audio_query.dart';

// Future<List<SongModel>> fetchSongs() async {
//   final fetchedsongs = await Helper.query.querySongs();

//   return fetchedsongs;
// }

Future<List<SongModel>> fetchlastSongs() async {
  final fetchedSongs = await Helper.query.querySongs(
    sortType: SongSortType.DATE_ADDED,
    orderType: OrderType.DESC_OR_GREATER,
  );

  return fetchedSongs;
}

Future<List<SongModel>> filterSongs(
    Future<List<SongModel>> fetchedSongs) async {
  final filterdsongs = await fetchedSongs; // Await the Future to get the list
  return filterdsongs.where((song) {
    final isWhatsAppFile =
        song.data.contains("WhatsApp") || song.displayName.startsWith("PTT");
    final isOpusFile = song.fileExtension == "opus";
    return !isWhatsAppFile && !isOpusFile; // Add more conditions if needed
  }).toList();
}
