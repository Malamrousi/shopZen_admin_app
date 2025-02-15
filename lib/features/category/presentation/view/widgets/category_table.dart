import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';

import '../../../../../core/assets/assets.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../core/utils/colors_manger.dart';
import '../../../../../core/utils/styles/app_text_styles.dart';
import '../../../../../core/widgets/table_cell_title_widget.dart';
import '../../../../../responsive_layout.dart';

class CategoryTable extends StatelessWidget {
  const CategoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;

    return Table(
      border: TableBorder.all(color: ColorsManger.primaryColor500),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
 columnWidths: {
  0: FlexColumnWidth(ResponsiveLayout.isMobile(context) ? 2.5: 1), // Image column
  1: FlexColumnWidth(ResponsiveLayout.isMobile(context) ? 2.5 :1), // Name column
  2: FlexColumnWidth(ResponsiveLayout.isMobile(context) ? 2 : 1), // Creation date column
  3: FlexColumnWidth(ResponsiveLayout.isMobile(context) ? 2 : 1), // Update date column
  4: FlexColumnWidth ( ResponsiveLayout.isMobile(context) ? 2 : 0.8), // Actions column - slightly smaller
},
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: ColorsManger.primaryColor400,
          ),
          children: [
            // Image
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                icon: Icons.image,
                title: "image".tr(context),
              ),
            ),
            // Name
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                icon: Icons.category,
                title: "category_name".tr(context),
              ),
            ),
            // Creation date
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                icon: Icons.create,
                title: "creation_at".tr(context),
              ),
            ),
            // Update date
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                icon: Icons.update,
                title: "updated_at".tr(context),
              ),
            ),
            // Actions
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                icon: Icons.attractions_rounded,
                title: "actions".tr(context),
              ),
            ),
          ],
        ),
        ...List.generate(
          10,
          (index) => TableRow(
            decoration: BoxDecoration(
              color: isDark ? ColorsManger.blackColor : ColorsManger.whiteColor,
            ),
            children: [
              // Image
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: Image.network(
                        "https://www.bing.com/ck/a?!&&p=78ea4b271a26a8983c047d00abaffbba6c0a8596dc45f4bea100cd250e88e5d1JmltdHM9MTczOTA1OTIwMA&ptn=3&ver=2&hsh=4&fclid=22c91547-5363-6e58-3d2d-00c4521f6f84&u=a1L2ltYWdlcy9zZWFyY2g_cT1VU0VSJTIwQVZURVIlMjBJTUFHRSZGT1JNPUlRRlJCQSZpZD0yM0RBNjQ1N0RFQTYyQzU4REVCRTNFNTQ3QjFFMTAxNjk2MkU0RDIy&ntb=1",
                        width: 50,
                        height: 50,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            Assets.imagesUserAvatar,
                            width: 50,
                            height: 50,
                          );
                        },
                      )),
                ),
              ),
              // Name
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    "Category",
                    style: ResponsiveLayout.isDesktop(context)
                        ? AppTextStyles.font16Medium(context)
                        : AppTextStyles.font16MediumFixedFontSize(context),
                  ),
                ),
              ),
              // Creation date
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    "15/2/2025",
                    style: ResponsiveLayout.isDesktop(context)
                        ? AppTextStyles.font16Medium(context)
                        : AppTextStyles.font16MediumFixedFontSize(context),
                  ),
                ),
              ),
              // Update date
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child:Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    "15/2/2025",
                    style: ResponsiveLayout.isDesktop(context)
                        ? AppTextStyles.font16Medium(context)
                        : AppTextStyles.font16MediumFixedFontSize(context),
                  ),
                ),
              
              ),
              // Actions
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        color: ColorsManger.primaryColor500,
                        size: ResponsiveLayout.isDesktop(context) ? 30 : 19.sp,
                      ),
                      horizontalSpacing(5),
                      Icon(
                        Icons.delete,
                        color: ColorsManger.alertColorRed500,
                        size: ResponsiveLayout.isDesktop(context) ? 30 : 19.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
