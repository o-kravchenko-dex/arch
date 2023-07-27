import 'package:arch/bloc/counter_bloc.dart';
import 'package:arch/router/router.dart';
import 'package:arch/view/change_counter_page/increment/increment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DecrementPageView extends IncrementPageView {
  const DecrementPageView({super.key, required super.title});

  @override
  Widget floatingButton(BuildContext context) => FloatingActionButton(
        onPressed: () {
          context.read<CounterBloc>().add(DecrementCounterEvent());
        },
        tooltip: 'Decrement',
        child: const Icon(Icons.remove),
      );

  @override
  PreferredSizeWidget appBar(BuildContext context) => AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        leading: BackButton(
          onPressed: () {
            if( context.canPop()) {
              context.pop();
            }
          },
        ),
      );

  @override
  Widget navigateButton(BuildContext context) => OutlinedButton(
        onPressed: () {
          context.canPop() ? context.pop() : context.goNamed(AppRoutesNames.increment);
        },
        child: const Text(
          'Go to increment',
        ),
      );
}
