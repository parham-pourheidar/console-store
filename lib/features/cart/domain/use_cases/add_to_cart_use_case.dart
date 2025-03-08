import '../entities/favorite_product.dart';
import '../repositories/add_to_cart_repository.dart';
import 'package:dartz/dartz.dart';

class AddToCartUseCase {
  final AddToCartRepository addToCartRepository;

  AddToCartUseCase(this.addToCartRepository);

  Future<Either<List<FavoriteProduct>, Error>> call(int productId) {
    return addToCartRepository(productId);
  }
}
