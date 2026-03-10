part of 'naruto_cubit.dart';

sealed class NarutoState {}

final class NarutoInitial extends NarutoState {}

final class Loading extends NarutoState {}

final class Error extends NarutoState {
  final String message;

  Error(this.message);
}

final class Success extends NarutoState {
  final List<NarutoModel> list;

  Success(this.list);
}
