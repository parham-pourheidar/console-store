import 'package:console_store/features/products/domain/entities/product.dart';

class FavoriteProduct {
  final Product product;
  final int count;

  FavoriteProduct({required this.product, required this.count});
}
