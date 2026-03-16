import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:calculator/data/hive_helper.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final HiveHelper hiveHelper = HiveHelper();
  Timer? _timer;
  CounterBloc() : super(CounterState(count: 0, isPressed: false)) {
    on<LoadCounterEvent>((event, emit) async {
      final savedCount = await hiveHelper.getCounter();
      emit(CounterState(count: savedCount, isPressed: false));
    });

    on<StartIncrementingEvent>((event, emit) async {
      _timer?.cancel();
      emit(CounterState(count: state.count, isPressed: true));
      _timer = Timer.periodic(const Duration(milliseconds: 100), (timer){
        add(_UpdadeCountEvent());
      });
    });

    on<StopIncrementingEvent> ((event, emit) async{
      _timer?.cancel();
      await hiveHelper.saveCount(state.count,);
      emit(CounterState(count: state.count, isPressed: false));
    });

    on<_UpdadeCountEvent>((event, emit) {
      emit(CounterState(count: state.count + 1, isPressed: true));
    });

  }

  @override
  Future<void> close(){
    _timer?.cancel();
    return super.close();
  }

}

class _UpdadeCountEvent extends CounterEvent{}
