import 'package:console_store/features/products/data/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeProductsDataSource {
  final SupabaseClient supabase;

  HomeProductsDataSource(this.supabase);

  Future<List<ProductModel>> call() async {
    List<
        Map<String,
            dynamic>> products = await supabase.from('product').select().or(
        "category.eq.بازی پلی استیشن,category.eq.لوازم جانبی ایکس باکس,discount.gt.0");
    List<ProductModel> productsList = products
        .map((Map<String, dynamic> productData) =>
            ProductModel.fromJson(productData))
        .toList();
    return productsList;
  }
}
