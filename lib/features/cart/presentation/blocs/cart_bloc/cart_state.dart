part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

class CartInitial extends CartState {}

class GetCartLoading extends CartState {}

class GetCartLoaded extends CartState {
  final List<FavoriteProduct> favoriteProducts;
  GetCartLoaded(this.favoriteProducts);
}

class GetCartLoadFailed extends CartState {}

class UpdatingCart extends CartState {}
