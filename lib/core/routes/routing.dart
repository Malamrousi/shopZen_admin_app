import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/routes/page_slide_transition.dart';
import 'package:shopzen_admin_dashboard/core/routes/route_name.dart';
import 'package:shopzen_admin_dashboard/core/screens/under_build_screen.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/login_screen.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/sign_up_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.login:
      return PageSlideTransition(page: LoginScreen());
    case RouteName.signUp:
      return PageSlideTransition(page: SignUpScreen());
    default:
      return MaterialPageRoute(builder: (_) => PageUnderBuildScreen());
  }
}
