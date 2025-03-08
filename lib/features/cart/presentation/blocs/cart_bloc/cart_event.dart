part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class GetCart extends CartEvent {}

class AddToCart extends CartEvent {
  final int productId;

  AddToCart(this.productId);
}

class RemoveFromCart extends CartEvent {
  final int productId;

  RemoveFromCart(this.productId);
}
