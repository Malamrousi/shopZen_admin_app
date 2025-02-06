import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopzen_admin_dashboard/core/helper/extension.dart';
import 'package:shopzen_admin_dashboard/core/helper/theme_extension.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_pref.dart';
import 'package:shopzen_admin_dashboard/core/utils/colors_manger.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';
import '../../../core/helper/spacing.dart';
import '../shared_pref/shared_prefs_key.dart';
import '../../features/home/data/model/admin_bar_model.dart';

class CustomDrawerWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomDrawerWidget(
      {super.key, required this.selectedIndex, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;

    return Drawer(
      width: 250.w,
      child: Container(
        color: isDark ? ColorsManger.blackColor : ColorsManger.whiteColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                context.imageExtension.images["logo"] ?? "",
                height: 100,
                width: 100,
              ),
              verticalSpacing(30.h),
              Expanded(
                child: ListView.builder(
                  itemCount: getAdminBarItems.length,
                  itemBuilder: (context, i) {
                    bool isSelected = selectedIndex == i;
                    return InkWell(
                      onTap: () {
                        onItemSelected(i);
                        context.pushNamedAndRemoveUntil(getAdminBarItems[i].routeName);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? ColorsManger.primaryColor400
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                getAdminBarItems[i].imageGetter(context),
                                width: 20,
                                color: isSelected ? ColorsManger.whiteColor : null),
                            horizontalSpacing(10),
                            Text(getAdminBarItems[i].title,
                                style: AppTextStyles.font16Medium(context).copyWith(
                                  color: isSelected ? ColorsManger.whiteColor : null,
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}