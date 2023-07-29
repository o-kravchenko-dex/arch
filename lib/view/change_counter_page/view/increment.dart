import 'package:arch/bloc/counter_bloc.dart';
import 'package:arch/router/router.dart';
import 'package:arch/view/change_counter_page/view/change_counter_base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class IncrementPageView extends ChangeCounterBaseView {

  const IncrementPageView({super.key, required super.title});

  @override
  Widget navigateButton(BuildContext context) => OutlinedButton(
        onPressed: () {
          context.pushNamed(AppRoutesNames.decrement);
        },
        child: const Text(
          'Go to decrement',
        ),
      );

  @override
  Widget floatingButton(BuildContext context) => FloatingActionButton(
        onPressed: () {
          context.read<CounterBloc>().add(IncrementCountEvent());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      );
}
