import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/create_category_request_body.dart';
import '../../../data/repo/category_repo.dart';

part 'create_category_event.dart';
part 'create_category_state.dart';
part 'create_category_bloc.freezed.dart';

class CreateCategoryBloc
    extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  final CategoryRepo categoryRepo;
  CreateCategoryBloc({required this.categoryRepo}) : super(_Initial()) {
    on<NewCrateCategoryEvent>(createCategory);
  }

  FutureOr<void> createCategory(
      NewCrateCategoryEvent event, Emitter<CreateCategoryState> emit) async {
    emit(CreateCategoryState.loading());

    final result = await categoryRepo.crateCategory(category: event.category);

    result.when(success: (success) {
      emit(CreateCategoryState.success());
    }, failure: (error) {
      emit(CreateCategoryState.failure(failureMessage: error));
    });
  }
}
