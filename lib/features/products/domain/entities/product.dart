class Product {
  final int id;
  final String title;
  final int price;
  final int discount;
  final String category;
  final String description;
  final String details;
  final String image;
  final int priceAfterDiscount;

  Product(
      {required this.priceAfterDiscount,
      required this.id,
      required this.title,
      required this.price,
      required this.discount,
      required this.category,
      required this.description,
      required this.details,
      required this.image});
}
