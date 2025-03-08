import '../entities/favorite_product.dart';
import '../repositories/get_cart_repository.dart';

import 'package:dartz/dartz.dart';

class GetCartUseCase {
  final GetCartRepository getCartRepository;

  GetCartUseCase(this.getCartRepository);

  Future<Either<Error, List<FavoriteProduct>>> call() async {
    return getCartRepository();
  }
}