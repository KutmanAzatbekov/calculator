import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:calculator/quiz/model/quiz_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizState());
  Timer? _timer;

  Future<void> loadQuiz() async {
    emit(state.copyWith(status: QuizStatus.loading));
    final dio = Dio();
    try {
      final response = await dio.get('https://opentdb.com/api.php?amount=10&type=multiple');
      print("API RESPONSE: ${response.data}");
      if (response.data['results'] == null || (response.data['results'] as List).isEmpty) {
        print("Ошибка: API вернул пустой список. Код ответа: ${response.data['response_code']}");
        emit(state.copyWith(status: QuizStatus.error));
        return;
      }
        final List results = response.data['results'];
        final question = results.map((q) => QuizModel.fromJson(q)).toList();
        emit(state.copyWith(status: QuizStatus.playing, questions: question));
        _startTimer();

    } catch (e, stacktrace) {
      print("ERROR LOADING: $e");
      print(stacktrace);
      emit(state.copyWith(status: QuizStatus.error));
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeRemaining > 0 && state.status == QuizStatus.playing) {
        emit(state.copyWith(timeRemaining: state.timeRemaining - 1));
      } else {
        finishQuiz();
      }
    });
  }



  void answerQuestion(String answer) {
    if (state.isLocked) return;

    final isCorrect =
        answer == state.questions[state.currentIndex].correctAnswer;
    emit(state.copyWith(
      selectedAnswer: answer,
      isLocked: true,
      correctCount: isCorrect ? state.correctCount + 1 : state.correctCount,
    ));

    Future.delayed(const Duration(seconds: 2), () {
      if (state.currentIndex + 1 < state.questions.length) {
        emit(state.copyWith(
            currentIndex: state.currentIndex + 1,
            isLocked: false,
            selectedAnswer: null));
      } else {
        finishQuiz();
      }
    });
  }

  void finishQuiz() {
    _timer?.cancel();
    emit(state.copyWith(status: QuizStatus.finished));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
