import 'package:arch/view/change_counter_page/change_counter_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutesPaths.increment,
        name: AppRoutesNames.increment,
        builder: (context, state) => const ChangingCounterPage(
          title: 'Increment',
          type: PageTypeEnum.increment,
        ),
      ),
      GoRoute(
        path: AppRoutesPaths.decrement,
        name: AppRoutesNames.decrement,
        builder: (context, state) => const ChangingCounterPage(
          title: 'Decrement',
          type: PageTypeEnum.decrement,
        ),/**/
      ),
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
