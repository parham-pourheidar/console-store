import 'package:dartz/dartz.dart';

import '../entities/favorite_product.dart';

abstract class RemoveFromCartRepository {
  Future<Either<List<FavoriteProduct>, Error>> call(int productId);
}
