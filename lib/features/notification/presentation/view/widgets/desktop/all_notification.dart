import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/features/notification/presentation/bloc/get_all_notification/get_all_notification_bloc.dart';

import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/utils/styles/app_text_styles.dart';
import 'custom_card.dart';

class AllNotification extends StatelessWidget {
  const AllNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacing(20),
        Text(
          "all_notification".tr(context),
          style: AppTextStyles.font25MediumPrimary700(context),
        ),
        verticalSpacing(20),
        BlocBuilder<GetAllNotificationBloc, GetAllNotificationState>(
          builder: (context, state) {
            return state.when(loading: () {
              return const Center(child: CircularProgressIndicator());
            }, failure: (message) {
              return Center(
                  child: Text(
                "error_while_fetching_notification".tr(context),
                style: AppTextStyles.font16BoldFixedFontSize(context),
              ));
            }, success: (data) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return  CustomCard(
                    indexId: index,
                    notifications: data[index],
                  );
                },
              );
            }, empty: () {
              return Center(
                  child: Text(
                "no_notification_found".tr(context),
                style: AppTextStyles.font16BoldFixedFontSize(context),
              ));
            });
          },
        ),
        verticalSpacing(20),
      ],
    );
  }
}
