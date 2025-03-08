import 'package:dartz/dartz.dart';

import '../entities/favorite_product.dart';

abstract class GetCartRepository {
  Future<Either<Error, List<FavoriteProduct>>> call();
}
