import 'package:dartz/dartz.dart';

import '../entities/favorite_product.dart';

abstract class AddToCartRepository {
  Future<Either<List<FavoriteProduct>, Error>> call(int productId);
}
