import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'naruto_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class NarutoModel {
  @HiveField(0)
final String name;
  @HiveField(1)
final List<String> images;


  factory NarutoModel.fromJson(Map<String, dynamic> json) => _$NarutoModelFromJson(json);

  Map<String, dynamic> toJson() => _$NarutoModelToJson(this);

  NarutoModel({required this.name, required this.images});

}