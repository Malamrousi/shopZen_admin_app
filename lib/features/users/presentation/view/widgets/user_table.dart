import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/assets/assets.dart';
import 'package:shopzen_admin_dashboard/core/utils/colors_manger.dart';
import 'package:shopzen_admin_dashboard/responsive_layout.dart';

import '../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../core/utils/styles/app_text_styles.dart';
import 'table_cell_title_widget.dart';

class UserTable extends StatelessWidget {
  const UserTable({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final bool isMobile = screenWidth < 600;
    bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;

    return Table(
      border: TableBorder.all(color: ColorsManger.primaryColor500),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FixedColumnWidth(
            ResponsiveLayout.isMobile(context) ? 190.w : 70.w), // Image column
        1: FlexColumnWidth(70.w), // Name column
        2: FlexColumnWidth(70.w), // Email column
        3: FixedColumnWidth(isMobile ? 90.w : 70.w), // Delete column
      },
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: ColorsManger.primaryColor400,
          ),
          children: [
            //image
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.bottom,
              child: TableCellTitleWidget(
                icon: Icons.image,
                title: "image".tr(context),
              ),
            ),
            //NAME
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.bottom,
              child: TableCellTitleWidget(
                icon: Icons.person,
                title: "name".tr(context),
              ),
            ),
            //EMAIL
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                icon: Icons.email,
                title: "email".tr(context),
              ),
            ),
            //delete
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                icon: Icons.delete,
                color: ColorsManger.alertColorRed500,
                title: "delete".tr(context),
              ),
            ),
          ],
        ),
        ...List.generate(
          150,
          (index) => TableRow(
            decoration: BoxDecoration(
              color: isDark ? ColorsManger.blackColor : ColorsManger.whiteColor,
            ),
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.r),
                    child: Image.asset(
                      Assets.imagesUserAvatar,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Mohammed",
                    style: ResponsiveLayout.isDesktop(context)
                        ? AppTextStyles.font16Medium(context)
                        : AppTextStyles.font16MediumFixedFontSize(context),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "8i4sR@example.com",
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Icon(
                  Icons.delete,
                  color: ColorsManger.alertColorRed500,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
