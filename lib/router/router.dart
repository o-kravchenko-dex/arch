import 'package:arch/view/change_counter_page/view/decrement.dart';
import 'package:arch/view/change_counter_page/view/increment.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final router = GoRouter(
    routes: [
      GoRoute(
          path: AppRoutesPaths.increment,
          name: AppRoutesNames.increment,
          builder: (context, state) => const IncrementPageView(title: 'Increment')),
      GoRoute(
          path: AppRoutesPaths.decrement,
          name: AppRoutesNames.decrement,
          builder: (context, state) => const DecrementPageView(title: "Decrement")),
    ],
  );
}

class AppRoutesNames {
  static const increment = 'increment';
  static const decrement = 'decrement';
}

class AppRoutesPaths {
  static const increment = '/';
  static const decrement = '/decrement';
}
