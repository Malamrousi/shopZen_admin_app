import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/get_all_categories.dart';
import '../../../data/repo/get_all_categories_repo.dart';

part 'get_all_categories_event.dart';
part 'get_all_categories_state.dart';
part 'get_all_categories_bloc.freezed.dart';

class GetAllCategoriesBloc
    extends Bloc<GetAllCategoriesEvent, GetAllCategoriesState> {
  GetAllCategoriesBloc({required this.getAllCategoriesRepo})
      : super(GetAllCategoriesState.loading()) {
    on<GetCategoriesEvent>(getAllCategories);
  }

  final GetAllCategoriesRepo getAllCategoriesRepo;

  FutureOr<void> getAllCategories(
      GetAllCategoriesEvent event, Emitter emit) async {
    emit(GetAllCategoriesState.loading());
    final result = await getAllCategoriesRepo.getAllCategories();
    result.when(success: (data) {
      if(data.categoriesList!.isEmpty){
        emit(GetAllCategoriesState.empty());
      }
      else{
      emit(GetAllCategoriesState.success(categories: data));

      }
    }, failure: (failure) {
      emit(GetAllCategoriesState.failure(message: failure));
    });
  }
}
