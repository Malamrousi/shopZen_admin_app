import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/connectivity_controller.dart';
import 'package:shopzen_admin_dashboard/core/routes/route_name.dart';
import 'package:shopzen_admin_dashboard/core/routes/routing.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_prefs_key.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_theme.dart';

import 'core/app/app_localizations.dart';
import 'core/cubit/app_cubit/app_cubit.dart';
import 'core/di/di.dart';
import 'core/screens/no_network_screen.dart';
import 'core/shared_pref/shared_pref.dart';

class ShopZenAdminDashboard extends StatelessWidget {
  const ShopZenAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return BlocProvider(
            create: (context) => getIt.get<AppCubit>()
              ..changeAppThemeMode(
                sharedMode: SharedPref().getBoolean(PrefKeys.themeMode),
              )
              ..getSavedLanguage(),
            child: ScreenUtilInit(
              minTextAdapt: true,
              child: BlocBuilder<AppCubit, AppState>(
                buildWhen: (previous, current) {
                  return previous != current;
                },
                builder: (context, state) {
                  final cubit = context.read<AppCubit>();
                  return MaterialApp(
                    title: 'shopZen Dashboard',
                    debugShowCheckedModeBanner: false,
                    theme: cubit.isDark ? themeDark() : themeLight(),
                    locale: Locale(cubit.currentLangCode),
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
        
                    
                    navigatorKey: getIt.get<GlobalKey<NavigatorState>>(),
                    onGenerateRoute: generateRoute,
                    initialRoute:  SharedPref().getString(PrefKeys.isLogin) == "true"
                            ? RouteName.home
                            : RouteName.login,
                    localeResolutionCallback: (deviceLocale, supportedLocales) {
                      if (deviceLocale != null) {
                        for (var locale in supportedLocales) {
                          if (deviceLocale.languageCode == locale.languageCode &&
                              deviceLocale.countryCode == locale.countryCode) {
                            return locale;
                          }
                        }
                        for (var locale in supportedLocales) {
                          if (deviceLocale.languageCode == locale.languageCode) {
                            return locale;
                          }
                        }
                      }
                      return deviceLocale?.languageCode == ARABIC
                          ? ARABIC_LOCAL
                          : ENGLISH_LOCAL;
                    },
                  );
                },
              ),
            ),
          );
        } else {
          return MaterialApp(
            title: 'No Network',
            debugShowCheckedModeBanner: false,
            home: const NoNetworkScreen(),
          );
        }
      },
    );
  }
}