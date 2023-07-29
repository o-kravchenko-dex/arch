import 'package:arch/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ChangeCounterBaseView extends StatelessWidget{
  final String title;
  const ChangeCounterBaseView({super.key, required this.title});

  Widget navigateButton(BuildContext context);

  Widget floatingButton(BuildContext context);

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

  PreferredSizeWidget appBar(BuildContext context) => AppBar(
    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    title: Text(title),
  );
}