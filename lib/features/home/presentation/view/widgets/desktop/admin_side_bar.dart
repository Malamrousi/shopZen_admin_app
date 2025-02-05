import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopzen_admin_dashboard/core/helper/theme_extension.dart';

import 'package:shopzen_admin_dashboard/core/utils/colors_manger.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';

import '../../../../../../core/helper/spacing.dart';
import '../../../../data/model/admin_bar_model.dart';

class AdminSideBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const AdminSideBar({super.key, required this.selectedIndex, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset(
          context.imageExtension.images["logo"] ?? "",
          height: 100,
          width: 100,
        ),
        verticalSpacing(50),
        Column(
          children: [
            for (var i = 0; i < getAdminBarItems.length; i++)
              InkWell(
                onTap: () {
                  onItemSelected(i);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    color: selectedIndex == i ? ColorsManger.primaryColor400 : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(getAdminBarItems[i].imageGetter(context)),
                      horizontalSpacing(10),
                      Text(
                        getAdminBarItems[i].title,
                        style: AppTextStyles.font16Medium(context).copyWith(
                          color: selectedIndex == i ? Colors.white : Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
