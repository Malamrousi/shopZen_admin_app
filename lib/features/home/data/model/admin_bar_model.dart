// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/assets/assets.dart';
import 'package:shopzen_admin_dashboard/core/di/di.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_pref.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_prefs_key.dart';

class AdminBarModel {
  final String title;
  final String image;
  AdminBarModel({
    required this.title,
    required this.image,
  });
}

bool isDarkMode = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;
BuildContext? context = getIt<GlobalKey<NavigatorState>>().currentContext;

List<AdminBarModel> adminBarItems = [
  AdminBarModel(
      title: "dashboard".tr(context!),
      image: isDarkMode
          ? Assets.svgDashboardDarkTheme
          : Assets.svgDashboardLightTheme),
  AdminBarModel(
      title: "products".tr(context!),
      image: isDarkMode
          ? Assets.svgProductDarkTheme
          : Assets.svgProductLightTheme),
  AdminBarModel(
      title: "categories".tr(context!),
      image: isDarkMode
          ? Assets.svgCategoryDarkTheme
          : Assets.svgCategoryLightTheme),
  AdminBarModel(
      title: "users".tr(context!),
      image: isDarkMode ? Assets.svgUserDarkTheme : Assets.svgUserLightTheme),
  AdminBarModel(
      title: "notifications".tr(context!),
      image: isDarkMode
          ? Assets.svgNotificationDarkTheme
          : Assets.svgNotificationLightTheme),
  AdminBarModel(
      title: "settings".tr(context!),
      image: isDarkMode
          ? Assets.svgSettingsDarkTheme
          : Assets.svgSettingsLightTheme),
  AdminBarModel(
      title: "customer_service".tr(context!),
      image: isDarkMode
          ? Assets.svgCustomerServiceDarkTheme
          : Assets.svgCustomerServiceLightTheme),
  AdminBarModel(
      title: "logout".tr(context!),
      image:
          isDarkMode ? Assets.svgLogOutDarkTheme : Assets.svgLogOutLightTheme),
];
