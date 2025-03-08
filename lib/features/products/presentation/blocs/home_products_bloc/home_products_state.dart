part of 'home_products_bloc.dart';

@immutable
sealed class HomeProductsState {}

class HomeProductsInitial extends HomeProductsState {}

class Loading extends HomeProductsState {}

class LoadSuccessful extends HomeProductsState {
  final Map<String, List<ProductModel>> distinctProducts;
  LoadSuccessful(this.distinctProducts);
}

class LoadFailed extends HomeProductsState {}
