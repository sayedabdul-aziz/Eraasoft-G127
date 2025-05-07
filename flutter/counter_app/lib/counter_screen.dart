import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.remove,
                  ),
                  onPressed: () {
                    setState(() {
                      counter--;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add,
                  ),
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
