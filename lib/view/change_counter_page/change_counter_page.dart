import 'package:arch/bloc/counter_bloc.dart';
import 'package:arch/view/change_counter_page/increment/increment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'decrement/decrement.dart';

enum PageTypeEnum { increment, decrement }

class ChangingCounterPage extends StatelessWidget {
  final String title;
  final PageTypeEnum type;

  const ChangingCounterPage({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child:
          type == PageTypeEnum.increment ? IncrementPageView(title: title) : DecrementPageView(title: title),
    );
  }
}
