// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'naruto_model.dart';

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
