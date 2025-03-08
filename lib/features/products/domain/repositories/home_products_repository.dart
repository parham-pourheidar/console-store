import 'package:console_store/features/products/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeProductsRepository {
  Future<Either<Error, Map<String, List<ProductModel>>>> call();
}
