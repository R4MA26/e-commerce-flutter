import 'package:e_commarce/src/features/home/presentation/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static String home = 'home';
  static String login = 'login';
}

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    // TODO: will be used later
    // final authRepository = ref.watch(authRepositoryProvider);

    return GoRouter(
      initialLocation: '/home',
      debugLogDiagnostics: true,
      routerNeglect: true,
      // TODO: will be used later
      // redirect: (state) {
      //   final loggedIn = authRepository.currentUser == null ? false : true;
      //   final loggingIn = state.location == '/login';
      //   if (!loggedIn) return loggingIn ? null : '/login';
      //   if (loggingIn) return '/';
      //   return null;
      // },

      // /auth
      routes: [
        /// [TODO] add auth Routes
        // authRoutes,
        GoRoute(
          path: '/home',
          name: AppRoute.home,
          builder: (context, state) {
            /// [TODO] add extras
            // final extras = (state.extra as Extras?)?.extras;
            // final user = extras?[ExtrasKey.user] as User?;
            return const HomeScreen();
          },
        )
      ],
    );
  },
);
