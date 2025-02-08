import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen_admin_dashboard/core/cubit/upload_image/upload_image_cubit.dart';
import 'package:shopzen_admin_dashboard/core/di/di.dart';
import 'package:shopzen_admin_dashboard/core/routes/page_fade_transition.dart';
import 'package:shopzen_admin_dashboard/core/routes/page_slide_transition.dart';
import 'package:shopzen_admin_dashboard/core/routes/route_name.dart';
import 'package:shopzen_admin_dashboard/core/screens/under_build_screen.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/login_screen.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/sign_up_screen.dart';
import 'package:shopzen_admin_dashboard/features/category/presentation/view/category_screen.dart';
import 'package:shopzen_admin_dashboard/features/customer_services/presentation/view/customer_services_screen.dart';
import 'package:shopzen_admin_dashboard/features/home/presentation/bloc/users_number/user_number_bloc.dart';
import 'package:shopzen_admin_dashboard/features/notification/presentation/view/notifications_screen.dart';
import 'package:shopzen_admin_dashboard/features/settings/presentation/view/settings_screen.dart';
import 'package:shopzen_admin_dashboard/features/users/presentation/view/users_screen.dart';

import '../../features/home/presentation/bloc/category_number/category_number_bloc.dart';
import '../../features/home/presentation/bloc/product_number/product_number_bloc.dart';
import '../../features/home/presentation/view/home_screen.dart';
import '../../features/product/presentation/view/product_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.login:
      return PageSlideTransition(
          page: BlocProvider(
        create: (context) => getIt.get<AuthBloc>(),
        child: LoginScreen(),
      ));
    case RouteName.signUp:
      return PageSlideTransition(
          page: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => getIt.get<UploadImageCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<AuthBloc>(),
        )
      ], child: SignUpScreen())); 
    case RouteName.home:
      return PageFadeTransition(
        page: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt.get<CategoryNumberBloc>()
                ..add(
                  CategoryNumberEvent.getAllCategoryNumber(),
                ),
            ),
            BlocProvider(
              create: (context) => getIt.get<ProductNumberBloc>()
                ..add(
                  ProductNumberEvent.getProductNumber(),
                ),
            ),
            BlocProvider(
              create: (context) => getIt.get<UserNumberBloc>()
                ..add(
                  UserNumberEvent.getUsers(),
                ),
            ),
          ],
          child: HomeScreen(),
        ),
      );
    case RouteName.categories:
      return PageFadeTransition(
        page: CategoryScreen(),
      );
    case RouteName.products:
      return PageFadeTransition(
        page: ProductScreen(),
      );
    case RouteName.users:
      return PageFadeTransition(
        page: UsersScreen(),
      );
    case RouteName.notifications:
      return PageFadeTransition(
        page: NotificationsScreen(),
      );
    case RouteName.settings:
      return PageFadeTransition(
        page: SettingsScreen(),
      );
    case RouteName.customerService:
      return PageFadeTransition(
        page: CustomerServicesScreen(),
      );
    default:
      return MaterialPageRoute(builder: (_) => PageUnderBuildScreen());
  }
}
