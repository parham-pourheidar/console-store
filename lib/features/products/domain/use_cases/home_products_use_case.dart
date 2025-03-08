import '../../data/models/product_model.dart';

import 'package:dartz/dartz.dart';

import '../repositories/home_products_repository.dart';

class HomeProductsUseCase {
  final HomeProductsRepository homeProductsRepository;

  HomeProductsUseCase(this.homeProductsRepository);

  Future<Either<Error, Map<String, List<ProductModel>>>> call() async {
    return homeProductsRepository();
  }
}
