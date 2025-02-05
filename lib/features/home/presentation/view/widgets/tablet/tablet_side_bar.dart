import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopzen_admin_dashboard/core/helper/theme_extension.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_pref.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_prefs_key.dart';
import 'package:shopzen_admin_dashboard/core/utils/colors_manger.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';
import 'package:shopzen_admin_dashboard/features/home/data/model/admin_bar_model.dart';
import '../../../../../../core/helper/spacing.dart';

class TabletSideBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  final Function() onClose;

  const TabletSideBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;

    return Container(
      width: 400,
      color: isDark ? ColorsManger.blackColor : ColorsManger.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: selectedIndex == i
                            ? ColorsManger.primaryColor400
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              getAdminBarItems[i].imageGetter(context)),
                          horizontalSpacing(10),
                          Text(
                            getAdminBarItems[i].title,
                            style: AppTextStyles
                                .font14RegularThemeColorFixedFontSize(context),
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
