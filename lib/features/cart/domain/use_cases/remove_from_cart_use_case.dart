import '../entities/favorite_product.dart';
import '../repositories/remove_from_cart_repository.dart';
import 'package:dartz/dartz.dart';

class RemoveFromCartUseCase {
  final RemoveFromCartRepository removeFromCartRepository;

  RemoveFromCartUseCase(this.removeFromCartRepository);

  Future<Either<List<FavoriteProduct>, Error>> call(int productId) {
    return removeFromCartRepository(productId);
  }
}
