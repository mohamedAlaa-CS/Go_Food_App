import 'package:go_router/go_router.dart';
import 'package:yjahz_app/features/home/presentation/views/home_view.dart';

import '../../features/Auth screen/presentation/views/login_view.dart';
import '../../features/Auth screen/presentation/views/signup_view.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: LoginView.routeName,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: SignUpview.routeName,
        builder: (context, state) => SignUpview(),
      ),
      GoRoute(
        path: HomeView.routeName,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
