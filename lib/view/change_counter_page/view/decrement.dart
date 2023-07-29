import 'package:arch/bloc/counter_bloc.dart';
import 'package:arch/router/router.dart';
import 'package:arch/view/change_counter_page/view/change_counter_base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DecrementPageView extends ChangeCounterBaseView {
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
  Widget navigateButton(BuildContext context) => OutlinedButton(
        onPressed: () {
          context.canPop() ? context.pop() : context.goNamed(AppRoutesNames.increment);
        },
        child: const Text(
          'Go to increment',
        ),
      );
}
