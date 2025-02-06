import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopzen_admin_dashboard/features/home/data/repo/dashboard_repo.dart';

part 'category_number_event.dart';
part 'category_number_state.dart';
part 'category_number_bloc.freezed.dart';

class CategoryNumberBloc
    extends Bloc<CategoryNumberEvent, CategoryNumberState> {
  CategoryNumberBloc(this.dashboardRepo)
      : super(CategoryNumberState.loading()) {
    on<CategoryNumberEvent>(getAllCategory);
  }

  final DashboardRepo dashboardRepo;

  FutureOr<void> getAllCategory(
      CategoryNumberEvent event, Emitter<CategoryNumberState> emit) async {
    emit(CategoryNumberState.loading());
    final response = await dashboardRepo.numberOfCategory();

    response.when(success: (success) {
      emit(CategoryNumberState.success(
          number: success.allCategoryNumber));
    }, failure: (failure) {
      emit(CategoryNumberState.failure(message: failure));
    });
  }
}
