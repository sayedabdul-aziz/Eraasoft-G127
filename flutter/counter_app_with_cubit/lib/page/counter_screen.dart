import 'package:counter_app_with_cubit/bloc/counter_bloc.dart';
import 'package:counter_app_with_cubit/bloc/counter_event.dart';
import 'package:counter_app_with_cubit/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        body: BlocConsumer<CounterBloc, CounterState>(
          listener: (context, state) {
            if (state is CounterUpdatedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Counter updated: ${context.read<CounterBloc>().counter}',
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            }
          },
          builder: (context, state) {
            var bloc = context.read<CounterBloc>();
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(bloc.counter.toString(), style: TextStyle(fontSize: 30)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton.filled(
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          bloc.add(IncrementEvent());
                        },
                        icon: const Text('+'),
                      ),
                      const SizedBox(width: 20),
                      IconButton.filled(
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          bloc.add(DecrementEvent());
                        },
                        icon: const Text('-'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
