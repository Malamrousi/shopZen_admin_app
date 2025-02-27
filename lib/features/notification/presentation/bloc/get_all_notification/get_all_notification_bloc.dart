import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/hive/hive_data_base.dart';
import '../../../data/model/add_notification_model.dart';

part 'get_all_notification_event.dart';
part 'get_all_notification_state.dart';
part 'get_all_notification_bloc.freezed.dart';

class GetAllNotificationBloc
    extends Bloc<GetAllNotificationEvent, GetAllNotificationState> {
  GetAllNotificationBloc() : super(const GetAllNotificationState.loading()) {
    on<ViewAllNotificationEvent>(getAllNotification);
  }

  FutureOr<void> getAllNotification(
      ViewAllNotificationEvent event, Emitter<GetAllNotificationState> emit) async{
       emit(GetAllNotificationState.loading());
        try {
        
         final notificationsList =  HiveDataBase().notificationBox!.values.toList();
         if(notificationsList.isEmpty){
           emit(const GetAllNotificationState.empty());
         }else{
           emit(GetAllNotificationState.success(notificationsList: notificationsList));
         }
        } catch (e) {
          emit(GetAllNotificationState.failure(message: e.toString()));
        }
      }
}
