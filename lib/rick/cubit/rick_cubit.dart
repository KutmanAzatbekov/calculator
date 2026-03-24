import 'package:bloc/bloc.dart';
import 'package:calculator/data/repository.dart';
import 'package:calculator/rick/rick_model/rick_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'rick_state.dart';

@Injectable()
class RickCubit extends Cubit<RickState> {
  final Repository repository;
  RickCubit({required this.repository}) : super(RickState(isLoading: false));

  String? nextPage;

  Future<void> getRick() async {
    emit(state.copyWith(isLoading: true));
    final response = await repository.getRick();
    nextPage = response.info.next;
    emit(state.copyWith(list: response.results));
  }

  Future<void> getNextPage() async {
    if(nextPage != null && !state.isPaginationLoading) {
      emit(state.copyWith(isPaginationLoading: true));
      final response = await repository.getRick(nextPage: nextPage);
      nextPage = response.info.next;
      final currentList = state.list ?? [];
      final updatedList = [...currentList, ...response.results];
      emit(state.copyWith(list: updatedList, isPaginationLoading: false));
    }
  }
}
