import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopzen_admin_dashboard/core/helper/theme_extension.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';

import '../../../../../../core/helper/spacing.dart';
import '../../../../data/model/admin_bar_model.dart';

class AdminSideBar extends StatelessWidget {
  const AdminSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset(
          context.imageExtension.image ?? "",
          height: 100,
          width: 100,
        ),
        verticalSpacing(50),
        Column(
          children: [
            for (var item in adminBarItems)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(item.image),
                    horizontalSpacing(10),
                    Text(
                      item.title,
                      style: AppTextStyles.font16Medium(context),
                    )
                  ],
                ),
              ),
          ],
        )
      ],
    );
  }
}
