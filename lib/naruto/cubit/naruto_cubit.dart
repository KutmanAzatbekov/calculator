import 'package:bloc/bloc.dart';
import 'package:calculator/data/repository.dart';
import 'package:calculator/naruto/naruto_model/naruto_model.dart';
import 'package:meta/meta.dart';

part 'naruto_state.dart';

class NarutoCubit extends Cubit<NarutoState> {
  NarutoCubit() : super(NarutoInitial());

  void getCharacters() async{
    emit(Loading());
    final repository = Repository();
    final response = await repository.getHttp();
    emit(Success(response));
  }

}
