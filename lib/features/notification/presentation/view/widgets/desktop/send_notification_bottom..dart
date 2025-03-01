import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/features/notification/presentation/bloc/send_notification/send_notification_bloc.dart';

import '../../../../../../core/utils/show_toast.dart';
import '../../../../data/model/add_notification_model.dart';

class SendNotificationBottom extends StatelessWidget {
  const SendNotificationBottom(
      {super.key, required this.addNotificationModel, required this.indexId});
  final AddNotificationModel addNotificationModel;
  final int indexId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendNotificationBloc, SendNotificationState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            ShowToast.showToastSuccessTop(
                message: "notification_sent_successfully".tr(context));
          },
          failure: (message) {
            ShowToast.showToastErrorTop(message: "please_try_again".tr(context));
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(loading: (index) {
          if (index == indexId) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Icon(Icons.send, color: Colors.green);
          }
        }, orElse: () {
          return IconButton(
            icon: const Icon(Icons.send, color: Colors.green),
            onPressed: () {
              context
                  .read<SendNotificationBloc>()
                  .add(SendNotificationEvent.sendPushNotification(
                    title: addNotificationModel.title ?? "",
                    body: addNotificationModel.body ?? "",
                    productId: addNotificationModel.productId ?? -1,
                    indexId: indexId,
                  ));
            },
            padding: EdgeInsets.zero,
            iconSize: 20,
          );
        });
      },
    );
  }
}
