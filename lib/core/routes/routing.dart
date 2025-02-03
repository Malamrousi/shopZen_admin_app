import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen_admin_dashboard/core/cubit/upload_image/upload_image_cubit.dart';
import 'package:shopzen_admin_dashboard/core/di/di.dart';
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
      return PageSlideTransition(page: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt.get<UploadImageCubit>(),)
        ],
        child: SignUpScreen()));
    default:
      return MaterialPageRoute(builder: (_) => PageUnderBuildScreen());
  }
}
