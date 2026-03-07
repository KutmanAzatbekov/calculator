import 'package:json_annotation/json_annotation.dart';
part 'harry_model.g.dart';

@JsonSerializable()
class HarryModel {
  final String? fullName;
  final String? nickname;
  final String? image;
  final String? hogwartsHouse;

  final String? title;
  final String? releaseDate;

  final String? house;

  final String? spell;
  final String? use;


  HarryModel({this.fullName, this.nickname, this.image, this.hogwartsHouse, this.title, this.releaseDate, this.house, this.spell, this.use});

  factory HarryModel.fromJson(Map<String, dynamic> json) => _$HarryModelFromJson(json);
  Map<String, dynamic> toJson() => _$HarryModelToJson(this);
}