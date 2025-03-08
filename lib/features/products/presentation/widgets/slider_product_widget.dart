import 'package:cached_network_image/cached_network_image.dart';
import 'package:console_store/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/number_divider.dart';
import '../screens/product_details_screen.dart';

class SliderProductWidget extends StatelessWidget {
  const SliderProductWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    ColorScheme themeColors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => ProductDetailsScreen(
              product: product,
            ),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: themeColors.surface,
          ),
          width: 120,
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: product.image,
                width: 125,
                height: 125,
              ),
              SizedBox(
                width: 125,
                height: 65,
                child: Text(
                  product.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              product.discount > 0
                  ? SizedBox(
                      height: 15,
                      child: RichText(
                          text: TextSpan(
                        text: dividePrice(product.price.toString()),
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      )),
                    )
                  : SizedBox(
                      height: 15,
                    ),
              Row(
                spacing: 3,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'تومان',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    dividePrice(product.priceAfterDiscount.toString()),
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
