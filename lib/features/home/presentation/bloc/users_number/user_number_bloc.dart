import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopzen_admin_dashboard/features/home/data/repo/dashboard_repo.dart';

part 'user_number_event.dart';
part 'user_number_state.dart';
part 'user_number_bloc.freezed.dart';

class UserNumberBloc extends Bloc<UserNumberEvent, UserNumberState> {
  UserNumberBloc(this.dashboardRepo) : super(UserNumberState.loading()) {
    on<UserNumberEvent>(getAllUser);
  }
  final DashboardRepo dashboardRepo;

   FutureOr<void> getAllUser(
      UserNumberEvent event, Emitter<UserNumberState> emit) async {
    emit(UserNumberState.loading());
    final response = await dashboardRepo.numberOfUsers();

    response.when(success: (success) {
      emit(UserNumberState.success(userNumber: success.allUserNumber));
    }, failure: (failure) {
      emit(UserNumberState.failure(message: failure));
    });
  }
}
