import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/widgets/custom_bottom_sheet.dart';
import 'package:shopzen_admin_dashboard/features/category/data/models/get_all_categories.dart';
import 'package:intl/intl.dart';
import 'package:shopzen_admin_dashboard/features/category/presentation/view/update_new_category_bottom_sheet.dart';

import '../../../../../core/assets/assets.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../core/utils/colors_manger.dart';
import '../../../../../core/utils/styles/app_text_styles.dart';
import '../../../../../core/widgets/table_cell_title_widget.dart';
import '../../../../../responsive_layout.dart';

class CategoryTable extends StatelessWidget {
  const CategoryTable({super.key, required this.categoriesList});
  final List<GetAllCategoriesModel> categoriesList;

  @override
  Widget build(BuildContext context) {
    bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;

    return Table(
      border: TableBorder.all(color: ColorsManger.primaryColor500),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FlexColumnWidth(
            ResponsiveLayout.isMobile(context) ? 2.5 : 1), // Image column
        1: FlexColumnWidth(
            ResponsiveLayout.isMobile(context) ? 2.5 : 1), // Name column
        2: FlexColumnWidth(
            ResponsiveLayout.isMobile(context) ? 2 : 1), // Creation date column
        3: FlexColumnWidth(
            ResponsiveLayout.isMobile(context) ? 2 : 1), // Update date column
        4: FlexColumnWidth(ResponsiveLayout.isMobile(context)
            ? 2
            : 0.8), // Actions column - slightly smaller
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
          categoriesList.length,
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
                        categoriesList[index].image ?? Assets.imagesUserAvatar,
                        width: 50,
                        height: 50,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            Assets.imagesNotFoundImage,
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
                    categoriesList[index].name ?? "",
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
                    categoriesList[index].updatedAt != null
                        ? DateFormat('dd/MM/yyyy')
                            .format(categoriesList[index].creationAt!.toUtc())
                        : "ERROR",
                    style: ResponsiveLayout.isDesktop(context)
                        ? AppTextStyles.font16Medium(context)
                        : AppTextStyles.font16MediumFixedFontSize(context),
                  ),
                ),
              ),
              // Update date
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    categoriesList[index].updatedAt != null
                        ? DateFormat('dd/MM/yyyy')
                            .format(categoriesList[index].updatedAt!.toUtc())
                        : "ERROR",
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
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: ColorsManger.primaryColor500,
                          size:
                              ResponsiveLayout.isDesktop(context) ? 30 : 19.sp,
                        ),
                        onPressed: () {
                          CustomBottomSheet.showCustomModelBottomSheet(
                            context: context,
                            child: UpdateNewCategoryBottomSheet(),
                          );
                        },
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
