import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<IncrementCountEvent>(_onIncrement);
    on<DecrementCounterEvent>(_onDecrement);
  }

  _onIncrement(IncrementCountEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(data: state.data + 1));
  }

  _onDecrement(DecrementCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(data: state.data - 1));
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) => CounterState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(CounterState state) => state.toJson();
}
