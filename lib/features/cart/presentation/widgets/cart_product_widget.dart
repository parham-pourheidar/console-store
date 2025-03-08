import 'package:cached_network_image/cached_network_image.dart';
import 'package:console_store/core/utils/number_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../products/presentation/screens/product_details_screen.dart';
import '../../domain/entities/favorite_product.dart';
import '../blocs/cart_bloc/cart_bloc.dart';

class CartProductWidget extends StatelessWidget {
  const CartProductWidget({super.key, required this.favoriteProduct});

  final FavoriteProduct favoriteProduct;

  @override
  Widget build(BuildContext context) {
    ColorScheme themeColors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => ProductDetailsScreen(
              product: favoriteProduct.product,
            ),
          ));
        },
        child: Container(
          height: 170,
          width: double.infinity,
          color: Colors.grey.withAlpha(35),
          child: Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            textDirection: TextDirection.rtl,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 130,
                    width: 220,
                    child: Text(
                      favoriteProduct.product.title,
                      textDirection: TextDirection.rtl,
                      style:
                          TextStyle(fontSize: 26, color: themeColors.primary),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    spacing: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'تومان',
                        style: TextStyle(fontSize: 26),
                      ),
                      Text(
                        dividePrice(favoriteProduct.product.priceAfterDiscount
                            .toString()),
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: favoriteProduct.product.image,
                    height: 120,
                    width: 115,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    height: 40,
                    width: 125,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: Colors.grey.withAlpha(80))),
                    child: Row(
                      spacing: 2,
                      textDirection: TextDirection.rtl,
                      children: [
                        IconButton(
                          onPressed: () async {
                            BlocProvider.of<CartBloc>(context)
                                .add(AddToCart(favoriteProduct.product.id));
                          },
                          icon: Icon(
                            Icons.add,
                            size: 20,
                          ),
                          color: themeColors.primary,
                        ),
                        Text(
                          favoriteProduct.count.toString(),
                          style: TextStyle(fontSize: 25),
                        ),
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<CartBloc>(context).add(
                                RemoveFromCart(favoriteProduct.product.id));
                          },
                          icon: Icon(
                            favoriteProduct.count > 1
                                ? Icons.remove
                                : Icons.delete_outlined,
                            size: 20,
                          ),
                          color: themeColors.primary,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
