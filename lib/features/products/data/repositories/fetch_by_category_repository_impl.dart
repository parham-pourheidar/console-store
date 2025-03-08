import 'package:console_store/features/products/data/models/product_model.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/fetch_by_category_repository.dart';
import '../data_sources/remote/fetch_by_category_data_source.dart';

class FetchByCategoryRepositoryImpl implements FetchByCategoryRepository {
  final FetchByCategoryDataSource fetchByCategoryDataSource;

  FetchByCategoryRepositoryImpl(this.fetchByCategoryDataSource);

  @override
  Future<Either<Error, List<ProductModel>>> call(
      String category) async {
    try {
      List<ProductModel> productsList =
          await fetchByCategoryDataSource(category);
      return Right(productsList);
    } catch (e) {
      return Left(Error());
    }
  }
}
