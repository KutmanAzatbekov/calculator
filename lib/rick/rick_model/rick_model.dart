import 'package:json_annotation/json_annotation.dart';
part 'rick_model.g.dart';

@JsonSerializable()
class RickModel {
  final String name;
  final String image;

  factory RickModel.fromJson(Map<String, dynamic> json) => _$RickModelFromJson(json);

  Map<String, dynamic> toJson() => _$RickModelToJson(this);

  RickModel({required this.name, required this.image});
}

@JsonSerializable()
class InfoModel {
  final String? next;
  final String? prev;

  InfoModel({required this.next, required this.prev});

  factory InfoModel.fromJson(Map<String, dynamic> json) => _$InfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoModelToJson(this);
}

@JsonSerializable()
class RickWrapper{
  final List<RickModel> results;
  final InfoModel info;

  RickWrapper({required this.results, required this.info});

  factory RickWrapper.fromJson(Map<String, dynamic> json) => _$RickWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$RickWrapperToJson(this);
}


