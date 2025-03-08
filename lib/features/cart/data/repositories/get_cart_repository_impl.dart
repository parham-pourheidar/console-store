import 'package:console_store/features/cart/domain/entities/favorite_product.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/get_cart_repository.dart';
import '../data_sources/remote/get_cart_data_source.dart';

class GetCartRepositoryImpl implements GetCartRepository {
  final GetCartDataSource getCartDataSource;

  GetCartRepositoryImpl(this.getCartDataSource);

  @override
  Future<Either<Error, List<FavoriteProduct>>> call() async {
    try {
      List<FavoriteProduct> favoriteProducts = await getCartDataSource();

      return Right(favoriteProducts);
    } catch (e) {
      return Left(Error());
    }
  }
}
