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
    ProductNumberEvent event, 
    Emitter<ProductNumberState> emit
) async {
  try {
    emit(ProductNumberState.loading());
    print("Loading state emitted"); // Debug print
    
    final response = await dashboardRepo.numberOfProducts();
    print("Response received: $response"); // Debug print
    
    response.when(
      success: (success) {
        print("Success: ${success.getProductNumber}"); // Debug print
        emit(ProductNumberState.success(productNumber: success.getProductNumber));
      }, 
      failure: (failure) {
        print("Failure: $failure"); // Debug print
        emit(ProductNumberState.failure(message: failure));
      }
    );
  } catch (e) {
    print("Exception caught: $e"); // Debug print
    emit(ProductNumberState.failure(message: e.toString()));
  }
}
}
