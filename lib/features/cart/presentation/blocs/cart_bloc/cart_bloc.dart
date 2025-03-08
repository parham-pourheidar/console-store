import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/favorite_product.dart';
import '../../../domain/use_cases/add_to_cart_use_case.dart';
import '../../../domain/use_cases/get_cart_use_case.dart';
import '../../../domain/use_cases/remove_from_cart_use_case.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    final GetIt getIt = GetIt.instance;
    on<GetCart>((event, emit) async {
      emit(GetCartLoading());
      final GetCartUseCase getCartUseCase = getIt<GetCartUseCase>();
      final result = await getCartUseCase();
      result.fold((error) {
        emit(GetCartLoadFailed());
      }, (favoriteProduct) {
        emit(GetCartLoaded(favoriteProduct));
      });
    });
    on<AddToCart>((event, emit) async {
      emit(UpdatingCart());
      final AddToCartUseCase addToCartUseCase = getIt<AddToCartUseCase>();
      final result = await addToCartUseCase(event.productId);

      result.fold((favoriteProduct) {
        emit(GetCartLoaded(favoriteProduct));
      }, (error) {
        emit(GetCartLoadFailed());
      });
    });
    on<RemoveFromCart>((event, emit) async {
      emit(UpdatingCart());
      final RemoveFromCartUseCase removeFromCartUseCase =
          getIt<RemoveFromCartUseCase>();
      final result = await removeFromCartUseCase(event.productId);
      result.fold((favoriteProduct) {
        emit(GetCartLoaded(favoriteProduct));
      }, (error) {
        emit(GetCartLoadFailed());
      });
    });
  }
}
