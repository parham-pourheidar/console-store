import 'package:console_store/features/products/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class FetchByCategoryRepository {
  Future<Either<Error, List<ProductModel>>> call(String category);
}
