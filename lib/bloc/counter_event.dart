part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class IncrementCountEvent extends CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}