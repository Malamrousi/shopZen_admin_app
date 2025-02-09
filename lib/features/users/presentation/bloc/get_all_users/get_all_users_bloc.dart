import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopzen_admin_dashboard/features/users/data/repo/users_repo.dart';

import '../../../data/model/get_all_user_model.dart';

part 'get_all_users_event.dart';
part 'get_all_users_state.dart';
part 'get_all_users_bloc.freezed.dart';

class GetAllUsersBloc extends Bloc<GetAllUsersEvent, GetAllUsersState> {
  GetAllUsersBloc({required this.usersRepo}) : super(GetAllUsersState.loading()) {
    on<FetchAllUsersEvent>(getAllUsers);
  }

  final UsersRepo usersRepo;
  FutureOr<void> getAllUsers(FetchAllUsersEvent event, Emitter emit) async {
    if (event.isNotLoading) {
      emit(GetAllUsersState.loading());
    }
    final result = await usersRepo.getAllUsers();

    result.when(success: (users) {
      if(users.data!.users!.isEmpty){
        emit(GetAllUsersState.empty());
      }else{
        emit(GetAllUsersState.success(users: users.data!.users!));
      }

    }, failure: (failure) {
      emit(GetAllUsersState.failure(message: failure));
    });
  }
}
