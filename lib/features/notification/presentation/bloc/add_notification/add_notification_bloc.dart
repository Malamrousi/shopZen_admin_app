import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopzen_admin_dashboard/core/hive/hive_data_base.dart';

import '../../../data/model/add_notification_model.dart';

part 'add_notification_event.dart';
part 'add_notification_state.dart';
part 'add_notification_bloc.freezed.dart';

class AddNotificationBloc
    extends Bloc<AddNotificationEvent, AddNotificationState> {
  AddNotificationBloc() : super(const _Initial()) {
    on<createNotificationEvent>(createNotification);
  }

  FutureOr<void> createNotification(
      createNotificationEvent event, Emitter<AddNotificationState> emit) async {
    emit(const AddNotificationState.loading());
    try {
      await HiveDataBase().notificationBox!.add(event.addNotificationModel);
      emit(const AddNotificationState.success());
    } catch (e) {
      emit(AddNotificationState.failure(message: e.toString()));
    }
  }
}
