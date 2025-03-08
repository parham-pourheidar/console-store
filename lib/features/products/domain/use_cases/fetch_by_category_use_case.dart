import '../../data/models/product_model.dart';
import '../repositories/fetch_by_category_repository.dart';

import 'package:dartz/dartz.dart';

class FetchByCategoryUseCase {
  final FetchByCategoryRepository fetchByCategoryRepository;

  FetchByCategoryUseCase(this.fetchByCategoryRepository);

  Future<Either<Error, List<ProductModel>>> call(String category) async {
    return fetchByCategoryRepository(category);
  }
}
