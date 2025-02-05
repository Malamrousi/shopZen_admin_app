// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/di/di.dart';
import 'package:shopzen_admin_dashboard/core/helper/theme_extension.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_pref.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_prefs_key.dart';

class AdminBarModel {
  final String title;
  final String Function(BuildContext) imageGetter;

  AdminBarModel({
    required this.title,
    required this.imageGetter,
  });

  String getImage(BuildContext context) => imageGetter(context);
}


bool isDarkMode = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;
BuildContext? context = getIt<GlobalKey<NavigatorState>>().currentContext;
  final images = context!.imageExtension.images;



List<AdminBarModel> getAdminBarItems = [
  AdminBarModel(
      title: "dashboard".tr(context!),
      imageGetter: (context) => images["dashboard"] ?? ""),
  AdminBarModel(
      title: "products".tr(context!),
      imageGetter: (context) => images["products"] ?? ""),
  AdminBarModel(
      title: "categories".tr(context!),
      imageGetter: (context) => images["categories"] ?? ""),
  AdminBarModel(
      title: "users".tr(context!),
      imageGetter: (context) => images["users"] ?? ""),
  AdminBarModel(
      title: "notifications".tr(context!),
      imageGetter: (context) => images["notifications"] ?? ""),
  AdminBarModel(
      title: "settings".tr(context!),
      imageGetter: (context) => images["settings"] ?? ""),
  AdminBarModel(
      title: "customer_service".tr(context!),
      imageGetter: (context) => images["customer_service"] ?? ""),
  AdminBarModel(
      title: "logout".tr(context!),
      imageGetter: (context) => images["logout"] ?? ""),
];
