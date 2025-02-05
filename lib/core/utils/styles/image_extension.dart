import 'package:flutter/material.dart';

import '../../assets/assets.dart';

class ImageExtension extends ThemeExtension<ImageExtension> {
  final Map<String, String> images;

  const ImageExtension({required this.images});

  @override
  ThemeExtension<ImageExtension> copyWith({Map<String, String>? images}) {
    return ImageExtension(images: images ?? this.images);
  }

  @override
  ThemeExtension<ImageExtension> lerp(
      covariant ThemeExtension<ImageExtension>? other, double t) {
    if (other is! ImageExtension) {
      return this;
    }
    return ImageExtension(images: other.images);
  }

  static const ImageExtension lightColor = ImageExtension(images: {
    "logo": Assets.imagesLogoLightTheme,
    "dashboard": Assets.svgDashboardLightTheme,
    "products": Assets.svgProductLightTheme,
    "categories": Assets.svgCategoryLightTheme,
    "users": Assets.svgUserLightTheme,
    "notifications": Assets.svgNotificationLightTheme,
    "settings": Assets.svgSettingsLightTheme,
    "customer_service": Assets.svgCustomerServiceLightTheme,
    "logout": Assets.svgLogOutLightTheme,
  });

  static const ImageExtension darkColor = ImageExtension(images: {
    "logo": Assets.imagesLogoDarkTheme,
    "dashboard": Assets.svgDashboardDarkTheme,
    "products": Assets.svgProductDarkTheme,
    "categories": Assets.svgCategoryDarkTheme,
    "users": Assets.svgUserDarkTheme,
    "notifications": Assets.svgNotificationDarkTheme,
    "settings": Assets.svgSettingsDarkTheme,
    "customer_service": Assets.svgCustomerServiceDarkTheme,
    "logout": Assets.svgLogOutDarkTheme,
  });
}
