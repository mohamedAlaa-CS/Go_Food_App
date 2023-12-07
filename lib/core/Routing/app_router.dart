import 'package:go_router/go_router.dart';
import 'package:yjahz_app/features/log%20in/presentation/views/login_view.dart';
import 'package:yjahz_app/features/log%20in/presentation/views/signup_view.dart';

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
    ],
  );
}
