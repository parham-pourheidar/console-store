import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel(
      {required super.priceAfterDiscount,
      required super.id,
      required super.title,
      required super.price,
      required super.discount,
      required super.category,
      required super.description,
      required super.details,
      required super.image});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        discount: json['discount'],
        category: json['category'],
        description: json['description'],
        details: json['details'],
        image: json['image'],
        priceAfterDiscount:
            (json['price'] * (100 - json['discount']) / 100).round());
  }
}
