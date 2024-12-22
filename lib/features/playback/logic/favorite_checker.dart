import 'package:hive/hive.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';

Future<bool> checkFavorite(SongModelClass song) async {
  final songsfavDB = await Hive.openBox<SongModelClass>('favoritesongsBox');
  return songsfavDB.containsKey(song.key);
}
