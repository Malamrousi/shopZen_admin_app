import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopzen_admin_dashboard/features/home/data/repo/dashboard_repo.dart';

part 'product_number_event.dart';
part 'product_number_state.dart';
part 'product_number_bloc.freezed.dart';

class ProductNumberBloc extends Bloc<ProductNumberEvent, ProductNumberState> {
  ProductNumberBloc(this.dashboardRepo) : super(ProductNumberState.loading()) {
    on<ProductNumberEvent>(productEvent);
  }

  final DashboardRepo dashboardRepo;

  FutureOr<void> productEvent(
      ProductNumberEvent event, Emitter<ProductNumberState> emit) async {
    emit(ProductNumberState.loading());
    final response = await dashboardRepo.numberOfProducts();

    response.when(success: (success) {
      emit(ProductNumberState.success(productNumber: success.getProductNumber));
    }, failure: (failure) {
      emit(ProductNumberState.failure(message: failure));
    });
  }
}
