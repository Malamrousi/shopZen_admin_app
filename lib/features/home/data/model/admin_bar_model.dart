// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/di/di.dart';
import 'package:shopzen_admin_dashboard/core/helper/theme_extension.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_pref.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_prefs_key.dart';

import '../../../../core/routes/route_name.dart';

class AdminBarModel {
  final String title;
  final String Function(BuildContext) imageGetter;
  final String routeName;
  AdminBarModel({
    required this.title,
    required this.imageGetter,
    required this.routeName,
  });

  String getImage(BuildContext context) => imageGetter(context);
}

bool isDarkMode = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;
BuildContext? context = getIt<GlobalKey<NavigatorState>>().currentContext;
final images = context!.imageExtension.images;

List<AdminBarModel> getAdminBarItems = [
  AdminBarModel(
      title: "dashboard".tr(context!),
      imageGetter: (context) => images["dashboard"] ?? "",
      routeName: RouteName.home),
  AdminBarModel(
      title: "products".tr(context!),
      imageGetter: (context) => images["products"] ?? "",
      routeName: RouteName.products),
  AdminBarModel(
      title: "categories".tr(context!),
      imageGetter: (context) => images["categories"] ?? "",
      routeName: RouteName.categories),
  AdminBarModel(
      title: "users".tr(context!),
      imageGetter: (context) => images["users"] ?? "",
      routeName: RouteName.users),
  AdminBarModel(
      title: "notifications".tr(context!),
      imageGetter: (context) => images["notifications"] ?? "",
      routeName: RouteName.notifications),
  AdminBarModel(
      title: "settings".tr(context!),
      imageGetter: (context) => images["settings"] ?? "",
      routeName: RouteName.settings),
  AdminBarModel(
      title: "customer_service".tr(context!),
      imageGetter: (context) => images["customer_service"] ?? "",
      routeName: RouteName.customerService),
  AdminBarModel(
      title: "logout".tr(context!),
      imageGetter: (context) => images["logout"] ?? "",
      routeName: RouteName.login), // 🆕 إذا كان زر تسجيل خروج، قم بتعيين مسار تسجيل الدخول
];
