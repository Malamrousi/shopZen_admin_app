import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopzen_admin_dashboard/features/users/data/repo/users_repo.dart';

part 'delete_users_event.dart';
part 'delete_users_state.dart';
part 'delete_users_bloc.freezed.dart';

class DeleteUsersBloc extends Bloc<DeleteUsersEvent, DeleteUsersState> {
  DeleteUsersBloc({required this.usersRepo}) : super(const _Initial()) {
    on<RemoveUserEvent>(deleteUser);
  }
  final UsersRepo usersRepo;
  FutureOr<void> deleteUser(RemoveUserEvent event, Emitter emit) async {
    emit(DeleteUsersState.loading(userId: event.userId));

    final result = await usersRepo.deleteUser(userId: event.userId);

    result.when(success: (_) {
      emit(const DeleteUsersState.success());
    }, failure: (failure) {
      emit(DeleteUsersState.failure(message: failure));
    });
  }
}
