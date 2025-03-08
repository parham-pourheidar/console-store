import 'package:console_store/features/products/data/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FetchByCategoryDataSource {

  final SupabaseClient supabase;

  FetchByCategoryDataSource(this.supabase);

  Future<List<ProductModel>> call(String category) async {
    List<Map<String, dynamic>> products =
        await supabase.from('product').select().eq('category', category);
    List<ProductModel> productsList = products
        .map((Map<String, dynamic> productData) =>
            ProductModel.fromJson(productData))
        .toList();
    return productsList;
  }
}
