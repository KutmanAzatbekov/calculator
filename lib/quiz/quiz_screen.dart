import 'package:calculator/quiz/cubit/quiz_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Quiz App'),
      ),
      body: BlocBuilder<QuizCubit, QuizState>(builder: (context, state) {
        if (state.status == QuizStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == QuizStatus.finished) {
          return _ResultView(state: state);
        }
        if (state.status == QuizStatus.playing) {
          return _QuestionView(state: state);
        }

        if (state.status == QuizStatus.error) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Произошла ошибка при загрузке данных'),
                ElevatedButton(
                    onPressed: () => context.read<QuizCubit>().loadQuiz(),
                    child: const Text('Попробовать снова')),
              ],
            ),
          );
        }

        return Center(
          child: ElevatedButton(
              onPressed: () => context.read<QuizCubit>().loadQuiz(),
              child: const Text('Start')),
        );
      }),
    );
  }
}

class _QuestionView extends StatelessWidget {
  final QuizState state;

  const _QuestionView({required this.state});

  @override
  Widget build(BuildContext context) {
    final question = state.questions[state.currentIndex];
    final progress = (state.currentIndex + 1) / state.questions.length;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: progress,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Time: ${state.timeRemaining} sec',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            question.category,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            question.question,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          ...question.allAnswer
              .map((answer) => _AnswerButton(answer: answer, state: state))
              .toList(),
        ],
      ),
    );
  }
}

class _AnswerButton extends StatelessWidget {
  final String answer;
  final QuizState state;

  const _AnswerButton({required this.answer, required this.state});

  @override
  Widget build(BuildContext context) {
    Color btnColor = Colors.blueGrey.shade50;
    if (state.selectedAnswer != null) {
      if (answer == state.questions[state.currentIndex].correctAnswer) {
        btnColor = Colors.green;
      } else if (answer == state.selectedAnswer) {
        btnColor = Colors.red;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: btnColor,
            foregroundColor:
                state.selectedAnswer != null ? Colors.white : Colors.black,
          ),
          onPressed: state.isLocked
              ? null
              : () => context.read<QuizCubit>().answerQuestion(answer),
          child: Text(answer),
        ),
      ),
    );
  }
}

class _ResultView extends StatelessWidget {
  final QuizState state;

  const _ResultView({required this.state});

  @override
  Widget build(BuildContext context) {
    final categories =
        state.questions.map((e) => e.category).toSet().join(', ');
    final timeSpent = 180 - state.timeRemaining;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Тест Завершен!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            _resultRow('Времени потрачено', '$timeSpent сек'),
            _resultRow('Правильных ответов', '${state.correctCount}'),
            _resultRow('Неправильных ответов',
                '${state.questions.length - state.correctCount}'),
            _resultRow('Всего вопросов', '${state.questions.length}'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Категории:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              categories,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () => context.read<QuizCubit>().loadQuiz(),
                child: const Text('Повторить'))
          ],
        ),
      ),
    );
  }

  Widget _resultRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
