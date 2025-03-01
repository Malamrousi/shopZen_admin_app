import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/features/notification/data/model/add_notification_model.dart';
import 'package:shopzen_admin_dashboard/features/notification/presentation/bloc/add_notification/add_notification_bloc.dart';

import '../../../../../../core/utils/show_toast.dart';
import '../../../bloc/get_all_notification/get_all_notification_bloc.dart';

class DeleteNotificationBottom extends StatelessWidget {
  const DeleteNotificationBottom(
      {super.key, required this.addNotificationModel});

  final AddNotificationModel addNotificationModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNotificationBloc, AddNotificationState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            ShowToast.showToastSuccessTop(
                message: "notification_removed_successfully".tr(context));
            context.read<GetAllNotificationBloc>().add(
                  GetAllNotificationEvent.viewAllNotification(),
                );
          },
          failure: (message) {
            ShowToast.showToastErrorTop(message: message);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => Center(
                  child: const CircularProgressIndicator(),
                ),
            orElse: () {
              return IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  context.read<AddNotificationBloc>().add(
                        AddNotificationEvent.deleteNotification(
                            addNotificationModel: addNotificationModel),
                      );
                },
                padding: EdgeInsets.zero,
                iconSize: 20,
              );
            });
      },
    );
  }
}
