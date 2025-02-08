import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';
import 'package:shopzen_admin_dashboard/core/widgets/app_text_form_filed.dart';
import 'package:shopzen_admin_dashboard/features/users/presentation/view/widgets/user_table.dart';

class DisplayUserBody extends StatelessWidget {
  const DisplayUserBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          verticalSpacing(40),
          AppTextFormFiled(
            validator: (value) {},
            hintText: "search_for_users".tr(context),
            suffixIcon: const Icon(Icons.search),
            hintStyle: AppTextStyles.font16Medium(context),
          ),
          verticalSpacing(40),
          Flexible(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: UserTable(),
                )
              ],
            )),
        ],
      ),
    );
  }
}
