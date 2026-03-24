part of 'rick_cubit.dart';

class RickState {
  final List<RickModel>? list;
  final bool isLoading;
  final bool isPaginationLoading;

  RickState({this.list, this.isLoading = false, this.isPaginationLoading = false});

  RickState copyWith({
    List<RickModel>? list,
    bool? isLoading,
    bool? isPaginationLoading,
  }) {
    return RickState(
      list: list ?? this.list,
      isLoading: isLoading ?? this.isLoading,
      isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading
    );
  }
}
