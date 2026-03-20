import 'package:json_annotation/json_annotation.dart';

part 'quiz_model.g.dart';

@JsonSerializable()
class QuizModel {
  final String category;
  final String question;

  @JsonKey(name: 'correct_answer')
  final String correctAnswer;

  @JsonKey(name: 'incorrect_answers')
  final List<String> incorrectAnswer;

  @JsonKey(includeFromJson: false, includeToJson: false)
  late List<String> allAnswer;

  QuizModel({required this.category, required this.question, required this.correctAnswer, required this.incorrectAnswer}){
    allAnswer = [correctAnswer, ...incorrectAnswer]..shuffle();
  }

  factory QuizModel.fromJson(Map<String, dynamic> json) => _$QuizModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuizModelToJson(this);

}