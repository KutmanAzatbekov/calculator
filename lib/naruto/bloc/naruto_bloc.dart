import 'package:bloc/bloc.dart';
import 'package:calculator/data/hive_helper.dart';
import 'package:calculator/data/repository.dart';
import 'package:calculator/naruto/naruto_model/naruto_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'naruto_event.dart';

part 'naruto_state.dart';

@Injectable()
class NarutoBloc extends Bloc<NarutoEvent, NarutoState> {
  final HiveHelper _hiveHelper;
  final Repository _repository;

  NarutoBloc({required HiveHelper hiveHelper, required Repository repository})
      : _repository = repository, _hiveHelper = hiveHelper,
        super(NarutoState()) {
    on<GetCharactersEvent>((event, emit) async {
      emit(NarutoState(isLoading: true));
      final response = await _repository.getHttp();
      emit(NarutoState(isLoading: false, list: response));
    });

    on<GetLocalCharactersEvent>((event, emit) async{
      final list = await _hiveHelper.loadList();
      emit(NarutoState(isLoading: false, list: list));
    });

  }
}
