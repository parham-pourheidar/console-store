import 'package:console_store/features/products/data/models/product_model.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/home_products_repository.dart';
import '../data_sources/remote/home_products_data_source.dart';

class HomeProductsRepositoryImpl implements HomeProductsRepository {
  final HomeProductsDataSource homeProductsDataSource;

  HomeProductsRepositoryImpl(this.homeProductsDataSource);

  @override
  Future<Either<Error, Map<String, List<ProductModel>>>> call() async {
    try {
      List<ProductModel> productsList = await homeProductsDataSource();
      Map<String, List<ProductModel>> distinctProducts =
          separateProducts(productsList);
      return Right(distinctProducts);
    } catch (e) {
      return Left(Error());
    }
  }

  separateProducts(List<ProductModel> productsList) {
    List<ProductModel> discountedProducts =
        productsList.where((product) => product.discount > 0).toList();
    List<ProductModel> psGameProducts = productsList
        .where((product) => product.category == 'بازی پلی استیشن')
        .toList();
    List<ProductModel> xboxAccessoryProducts = productsList
        .where((product) => product.category == 'لوازم جانبی ایکس باکس')
        .toList();
    Map<String, List<ProductModel>> distinctProducts = {
      'discountedProducts': discountedProducts,
      'psGameProducts': psGameProducts,
      'xboxAccessoryProducts': xboxAccessoryProducts
    };
    return distinctProducts;
  }
}
