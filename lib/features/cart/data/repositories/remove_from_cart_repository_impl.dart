import '../../domain/entities/favorite_product.dart';
import '../../domain/repositories/remove_from_cart_repository.dart';
import '../data_sources/remote/remove_from_cart_data_source.dart';
import 'package:dartz/dartz.dart';

class RemoveFromCartRepositoryImpl implements RemoveFromCartRepository {
  final RemoveFromCartDataSource removeFromCartDataSource;

  RemoveFromCartRepositoryImpl(this.removeFromCartDataSource);

  @override
  Future<Either<List<FavoriteProduct>, Error>> call(int productId) async {
    try {
      List<FavoriteProduct> newProducts =
          await removeFromCartDataSource(productId);
      return Left(newProducts);
    } catch (e) {
      return Right(Error());
    }
  }
}
