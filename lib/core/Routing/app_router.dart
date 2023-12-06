import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yjahz_app/features/log%20in/presentation/views/login_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: LoginView.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginView(),
      ),
    ],
  );
}
