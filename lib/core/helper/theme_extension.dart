import 'package:flutter/material.dart';

import 'package:shopzen_admin_dashboard/core/utils/styles/color_extension.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/image_extension.dart';

extension ThemeExtension on BuildContext {
    ColorExtension get colorThemeExtension => Theme.of(this).extension<ColorExtension>()!;
    TextStyle get textStyle => Theme.of(this).textTheme.displaySmall!;
    ImageExtension get imageExtension => Theme.of(this).extension<ImageExtension>()!;
}