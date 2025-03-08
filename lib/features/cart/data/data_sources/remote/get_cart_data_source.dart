import 'package:console_store/features/cart/data/models/favorite_product_model.dart';
import 'package:console_store/features/cart/domain/entities/favorite_product.dart';
import 'package:console_store/features/products/data/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetCartDataSource {
  final SupabaseClient supabase;

  GetCartDataSource(this.supabase);

  Future<List<FavoriteProduct>> call() async {
    String userId = supabase.auth.currentUser!.id;
    List user = await supabase.from('cart').select().eq('user_id', userId);

    if (user.isEmpty) {
      return [];
    }

    Map favoriteProductsIds = user.first['counted_products'];

    List products = await supabase
        .from('product')
        .select()
        .inFilter('id', favoriteProductsIds.keys.toList());

    List<FavoriteProduct> favoriteProducts = products.map((rawProduct) {
      return FavoriteProductModel(
          product: ProductModel.fromJson(rawProduct),
          count: favoriteProductsIds[rawProduct['id'].toString()]!);
    }).toList();

    return favoriteProducts;
  }
}
