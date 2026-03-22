part of 'quiz_cubit.dart';

enum QuizStatus {initial, loading, playing, finished, error}

class QuizState {
  final QuizStatus status;
  final List<QuizModel> questions;
  final int currentIndex;
  final int correctCount;
  final int timeRemaining;
  final String? selectedAnswer;
  final bool isLocked;

  QuizState(
      {this.status = QuizStatus.initial,
      this.questions = const [],
      this.currentIndex = 0,
      this.correctCount = 0,
      this.timeRemaining = 180,
      this.selectedAnswer,
      this.isLocked = false});

  QuizState copyWith({
     QuizStatus? status,
     List<QuizModel>? questions,
     int? currentIndex,
     int? correctCount,
     int? timeRemaining,
     String? selectedAnswer,
     bool? isLocked,
}){
    return QuizState(
      status: status ?? this.status,
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      correctCount: correctCount ?? this.correctCount,
      timeRemaining: timeRemaining ?? this.timeRemaining,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      isLocked: isLocked ?? this.isLocked
    );
}

}

