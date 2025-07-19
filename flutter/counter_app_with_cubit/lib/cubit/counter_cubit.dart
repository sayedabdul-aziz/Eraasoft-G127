import 'package:counter_app_with_cubit/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitialState());

  int counter = 0;

  increment() {
    counter++;
    emit(CounterUpdatedState());
  }

  decrement() {
    counter--;
    emit(CounterUpdatedState());
  }
}
