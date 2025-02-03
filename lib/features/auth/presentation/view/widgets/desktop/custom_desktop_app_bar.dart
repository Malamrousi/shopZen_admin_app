import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/core/helper/theme_extension.dart';

import '../dark_and_lang_buttons.dart';

class CustomDesktopAppBar extends StatelessWidget {
  const CustomDesktopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,),
      child: Row(
        children: [
          
          Image.asset(context.imageExtension.image??"",
            height: 120,
            width: 120,),
          Spacer(),
          horizontalSpacing(20),
          DarkAndLangButtons(),
        ],
      ),
    );
  }
}

