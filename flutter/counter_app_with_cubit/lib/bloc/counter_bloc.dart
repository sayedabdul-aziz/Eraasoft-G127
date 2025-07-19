import 'package:counter_app_with_cubit/bloc/counter_event.dart';
import 'package:counter_app_with_cubit/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState()) {
    on((event, emit) {
      if (event is IncrementEvent) {
        increment(emit);
      } else if (event is DecrementEvent) {
        decrement(emit);
      }
    });
  }

  int counter = 0;

  increment(Emitter<CounterState> emit) {
    counter++;
    emit(CounterUpdatedState());
  }

  decrement(Emitter<CounterState> emit) {
    counter--;
    emit(CounterUpdatedState());
  }
}
