import 'package:hive/hive.dart';
import 'package:musicme/features/all_songs/model/songmodel_class.dart';
part 'playlist_model.g.dart';

@HiveType(typeId: 2)
class PlaylistModelClass {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  List<SongModelClass> songs;

  PlaylistModelClass({
    required this.name,
    List<SongModelClass>? songs,
    this.id,
  }) : songs = songs ?? [];
}
