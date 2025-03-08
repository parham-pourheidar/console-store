import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../products/data/models/product_model.dart';
import '../../../domain/entities/favorite_product.dart';
import '../../models/favorite_product_model.dart';

class AddToCartDataSource {
  final SupabaseClient supabase;

  AddToCartDataSource(this.supabase);

  Future<List<FavoriteProduct>> call(int productId) async {
    String userId = supabase.auth.currentUser!.id;
    List user = await supabase.from('cart').select().eq('user_id', userId);
    if (user.isEmpty) {
      await supabase
          .from('cart')
          .insert({'user_id': userId, 'counted_products': {}});
      user = await supabase.from('cart').select().eq('user_id', userId);
    }
    Map favoriteProductsIds = user.first['counted_products'];

    if (favoriteProductsIds.keys.contains(productId.toString())) {
      favoriteProductsIds.update(
          productId.toString(), (previous) => previous + 1);
    } else {
      favoriteProductsIds[productId.toString()] = 1;
    }
    await supabase.from('cart').update(
        {'counted_products': favoriteProductsIds}).eq('user_id', userId);

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
