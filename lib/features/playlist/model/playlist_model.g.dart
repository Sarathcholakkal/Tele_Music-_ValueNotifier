// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlaylistModelClassAdapter extends TypeAdapter<PlaylistModelClass> {
  @override
  final int typeId = 2;

  @override
  PlaylistModelClass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaylistModelClass(
      name: fields[1] as String,
      songs: (fields[2] as List?)?.cast<SongModelClass>(),
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PlaylistModelClass obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.songs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaylistModelClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
