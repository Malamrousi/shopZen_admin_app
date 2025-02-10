import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopzen_admin_dashboard/features/users/data/repo/users_repo.dart';

import '../../../data/model/get_all_user_model.dart';

part 'get_all_users_event.dart';
part 'get_all_users_state.dart';
part 'get_all_users_bloc.freezed.dart';

class GetAllUsersBloc extends Bloc<GetAllUsersEvent, GetAllUsersState> {
  GetAllUsersBloc({required this.usersRepo})
      : super(GetAllUsersState.loading()) {
    on<FetchAllUsersEvent>(getAllUsers);
    on<SearchForUsersEvent>(searchForUser);
  }

  final UsersRepo usersRepo;
  List<GetAllUserModel> userList = [];
  final TextEditingController searchController = TextEditingController();
  FutureOr<void> getAllUsers(FetchAllUsersEvent event, Emitter emit) async {
    if (event.isNotLoading) {
      emit(GetAllUsersState.loading());
    }
    final result = await usersRepo.getAllUsers();

    result.when(success: (users) {
      if (users.data!.users!.isEmpty) {
        emit(GetAllUsersState.empty());
      } else {
        userList = users.data!.users!;
        emit(GetAllUsersState.success(users: userList));
      }
    }, failure: (failure) {
      emit(GetAllUsersState.failure(message: failure));
    });
  }

  FutureOr<void> searchForUser(SearchForUsersEvent event, Emitter emit) async {
 final searchResult =   userList
        .where((user) =>
            user.name!
                .toLowerCase()
                .startsWith(event.search.toLowerCase().trim()) ||
            user.email!
                .toLowerCase()
                .startsWith(event.search.toLowerCase().trim()))
        .toList();

        if(searchResult.isEmpty){
          emit(GetAllUsersState.empty());
        }else{
          emit(GetAllUsersState.success(users: searchResult));
        }
  }
}
