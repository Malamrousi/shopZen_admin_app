import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';

import '../../../../../core/utils/colors_manger.dart';
import '../../../../../core/widgets/table_cell_title_widget.dart';
import '../../../../../responsive_layout.dart';

class CategoryTable extends StatelessWidget {
  const CategoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: ColorsManger.primaryColor500),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FixedColumnWidth(
            ResponsiveLayout.isMobile(context) ? 190.w : 70.w), // Image column
        1: FlexColumnWidth(75.w), // Name column
        2: FlexColumnWidth(70.w), // Creation date column
        3: FlexColumnWidth(70.w), // Update date column
        4: FixedColumnWidth(ResponsiveLayout.isMobile(context) ? 100.w : 50.w), // Actions column
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
      ],
    );
  }
}