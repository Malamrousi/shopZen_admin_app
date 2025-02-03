import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/assets/assets.dart';

class ImageExtension extends ThemeExtension<ImageExtension> {
  final String? image;
  const ImageExtension({
    this.image,
  });

  @override
  ThemeExtension<ImageExtension> copyWith({String? image}) {
    return ImageExtension(image: image);
  }

  @override
  ThemeExtension<ImageExtension> lerp(
      covariant ThemeExtension<ImageExtension>? other, double t) {
    if (other is! ImageExtension) {
      return this;
    }

    return ImageExtension(image: image);
  }

  static const ImageExtension lightColor =
      ImageExtension(image: Assets.imagesLogoLightTheme);
  static const ImageExtension darkColor =
      ImageExtension(image: Assets.imagesLogoDarkTheme);
}
