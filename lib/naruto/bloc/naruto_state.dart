part of 'naruto_bloc.dart';

class NarutoState {
  final bool isLoading;
  final String? error;
  final List<NarutoModel>? list;

  NarutoState({this.isLoading = false, this.error, this.list});
}


