import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopzen_admin_dashboard/features/notification/data/repo/send_notification_repo.dart';

part 'send_notification_event.dart';
part 'send_notification_state.dart';
part 'send_notification_bloc.freezed.dart';

class SendNotificationBloc
    extends Bloc<SendNotificationEvent, SendNotificationState> {
  SendNotificationBloc({
    required this.sendNotificationRepo,
  }) : super(_Initial()) {
    on<PushNotificationEvent>(sendNotification);
  }

  final SendNotificationRepo sendNotificationRepo;

  FutureOr<void> sendNotification(
      PushNotificationEvent event, Emitter emit) async {
    final response = await sendNotificationRepo.sendNotification(
      title: event.title,
      body: event.body,
      productId: event.productId,
    );
    response.when(success: (_) {
      emit(const SendNotificationState.success());
    }, failure: (message) {
      emit(SendNotificationState.failure(message: message));
    });
  }
}
