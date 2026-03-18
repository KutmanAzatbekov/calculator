part of 'counter_bloc.dart';


sealed class CounterEvent {}

class LoadCounterEvent extends CounterEvent{}

class StartIncrementingEvent extends CounterEvent{}

class StopIncrementingEvent extends CounterEvent{}
