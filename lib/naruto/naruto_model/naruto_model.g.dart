// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'naruto_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NarutoModelAdapter extends TypeAdapter<NarutoModel> {
  @override
  final int typeId = 0;

  @override
  NarutoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NarutoModel(
      name: fields[0] as String,
      images: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, NarutoModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NarutoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NarutoModel _$NarutoModelFromJson(Map<String, dynamic> json) => NarutoModel(
      name: json['name'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NarutoModelToJson(NarutoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'images': instance.images,
    };
