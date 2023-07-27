import 'package:arch/bloc/counter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MyHomePageView(title: title),
    );
  }
}

class MyHomePageView extends StatelessWidget {
  const MyHomePageView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: title),
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
              ],
            ),
          );
        },
      );

  Widget floatingButton(BuildContext context) => FloatingActionButton(
        onPressed: () {
          context.read<CounterBloc>().add(IncrementCountEvent());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      );

  PreferredSizeWidget appBar({required BuildContext context, required String title}) => AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      );
}
