import 'package:json_annotation/json_annotation.dart';

part 'naruto_model.g.dart';

@JsonSerializable()
class NarutoModel {
final String name;
final List<String> images;


  factory NarutoModel.fromJson(Map<String, dynamic> json) => _$NarutoModelFromJson(json);

  NarutoModel({required this.name, required this.images});

}