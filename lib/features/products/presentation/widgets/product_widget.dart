import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/utils/number_divider.dart';
import '../../domain/entities/product.dart';
import '../screens/product_details_screen.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 5, 2, 2),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(
              product: product,
            ),
          ));
        },
        child: Card(
          shadowColor: Colors.grey,
          elevation: 5,
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: product.image,
                width: 220,
                height: 190,
              ),
              SizedBox(
                height: 105,
                child: Text(
                  product.title,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Divider(
                indent: 8,
                endIndent: 8,
              ),
              Column(
                children: [
                  Text(
                    ':قیمت',
                    style: TextStyle(fontSize: 24),
                  ),
                  Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'تومان',
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        dividePrice(product.price.toString()),
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  product.discount != 0
                      ? Text(
                          'کالای دارای تخفیف',
                          style: TextStyle(color: Colors.red, fontSize: 21),
                        )
                      : SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
