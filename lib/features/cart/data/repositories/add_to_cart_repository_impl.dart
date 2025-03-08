import '../../domain/entities/favorite_product.dart';
import '../../domain/repositories/add_to_cart_repository.dart';
import '../data_sources/remote/add_to_cart_data_source.dart';
import 'package:dartz/dartz.dart';

class AddToCartRepositoryImpl implements AddToCartRepository {
  final AddToCartDataSource addToCartDataSource;

  AddToCartRepositoryImpl(this.addToCartDataSource);

  @override
  Future<Either<List<FavoriteProduct>, Error>> call(int productId) async {
    try {
      List<FavoriteProduct> newProducts = await addToCartDataSource(productId);
      return Left(newProducts);
    } catch (e) {
      return Right(Error());
    }
  }
}
