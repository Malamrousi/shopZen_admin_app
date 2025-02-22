import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/assets/assets.dart';
import 'package:shopzen_admin_dashboard/core/utils/colors_manger.dart';
import 'package:shopzen_admin_dashboard/features/users/data/model/get_all_user_model.dart';
import 'package:shopzen_admin_dashboard/responsive_layout.dart';

import '../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../core/utils/styles/app_text_styles.dart';
import 'delete_user_icon.dart';
import '../../../../../core/widgets/table_cell_title_widget.dart';

class UserTable extends StatelessWidget {
  const UserTable({super.key, required this.usersList});
  final List<GetAllUserModel> usersList;

  @override
  Widget build(BuildContext context) {

    bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;

    return Table(
      border: TableBorder.all(color: ColorsManger.primaryColor500),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FixedColumnWidth(
            ResponsiveLayout.isMobile(context) ? 190.w : 120.w), // Image column
        1: FlexColumnWidth(90.w), // Name column
        2: FlexColumnWidth(90.w), // Email column
        3: FixedColumnWidth(ResponsiveLayout.isMobile(context) ? 100.w : 90.w), // Delete column
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
          usersList.length,
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
                      child: Image.network(
                        usersList[index].image ?? "https://www.bing.com/ck/a?!&&p=78ea4b271a26a8983c047d00abaffbba6c0a8596dc45f4bea100cd250e88e5d1JmltdHM9MTczOTA1OTIwMA&ptn=3&ver=2&hsh=4&fclid=22c91547-5363-6e58-3d2d-00c4521f6f84&u=a1L2ltYWdlcy9zZWFyY2g_cT1VU0VSJTIwQVZURVIlMjBJTUFHRSZGT1JNPUlRRlJCQSZpZD0yM0RBNjQ1N0RFQTYyQzU4REVCRTNFNTQ3QjFFMTAxNjk2MkU0RDIy&ntb=1",
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
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    usersList[index].name ?? "no_name".tr(context),
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
                    usersList[index].email ?? "no_email".tr(context),
                    style: ResponsiveLayout.isDesktop(context)
                        ? AppTextStyles.font16Medium(context)
                        : AppTextStyles.font16MediumFixedFontSize(context),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: DeleteUserIcon(
                  userId: usersList[index].id ?? "",
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

