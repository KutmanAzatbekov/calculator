// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'harry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HarryModel _$HarryModelFromJson(Map<String, dynamic> json) => HarryModel(
      fullName: json['fullName'] as String?,
      nickname: json['nickname'] as String?,
      image: json['image'] as String?,
      hogwartsHouse: json['hogwartsHouse'] as String?,
      title: json['title'] as String?,
      releaseDate: json['releaseDate'] as String?,
      house: json['house'] as String?,
      spell: json['spell'] as String?,
      use: json['use'] as String?,
    );

Map<String, dynamic> _$HarryModelToJson(HarryModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'nickname': instance.nickname,
      'image': instance.image,
      'hogwartsHouse': instance.hogwartsHouse,
      'title': instance.title,
      'releaseDate': instance.releaseDate,
      'house': instance.house,
      'spell': instance.spell,
      'use': instance.use,
    };
