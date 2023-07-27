import 'package:arch/bloc/counter_bloc.dart';
import 'package:arch/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class IncrementPageView extends StatelessWidget {
  const IncrementPageView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: bodyBuilder(),
      floatingActionButton: floatingButton(context),
    );
  }

  Widget bodyBuilder() => BlocBuilder<CounterBloc, CounterState>(
        builder: (BuildContext context, CounterState state) {
          final count = state.data;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$count',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                navigateButton(context),
              ],
            ),
          );
        },
      );

  Widget navigateButton(BuildContext context) => OutlinedButton(
        onPressed: () {
          context.pushNamed(AppRoutesNames.decrement);
        },
        child: const Text(
          'Go to decrement',
        ),
      );

  Widget floatingButton(BuildContext context) => FloatingActionButton(
        onPressed: () {
          context.read<CounterBloc>().add(IncrementCountEvent());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      );

  PreferredSizeWidget appBar(BuildContext context) => AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      );
}
