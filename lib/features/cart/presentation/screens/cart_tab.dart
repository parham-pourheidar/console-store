import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/number_divider.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../blocs/cart_bloc/cart_bloc.dart';
import '../widgets/cart_product_widget.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme themeColors = Theme.of(context).colorScheme;
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is GetCartLoadFailed) {
        return Center(
          child: TextButton(
              onPressed: () {
                BlocProvider.of<CartBloc>(context).add(GetCart());
              },
              child: Text(
                '! تلاش مجدد',
                style: TextStyle(fontSize: 40),
              )),
        );
      } else if (state is GetCartLoaded) {
        if (state.favoriteProducts.isEmpty) {
          return Column(children: [
            Image.asset('assets/basket.gif'),
            Text(
              'سبد خرید شما خالی است',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: themeColors.primary),
            )
          ]);
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return CartProductWidget(
                      favoriteProduct: state.favoriteProducts[index],
                    );
                  },
                  itemCount: state.favoriteProducts.length,
                ).animate().fade(duration: Duration(milliseconds: 500)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                color: Colors.grey.withAlpha(100),
                height: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  textDirection: TextDirection.rtl,
                  children: [
                    Column(
                      children: [
                        Text(
                          ':مجموع سبد خرید',
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          spacing: 5,
                          children: [
                            Text(
                              dividePrice(getCartTotal(state).toString()),
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'تومان',
                              style: TextStyle(fontSize: 28),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          await launchUrl(Uri.parse(
                              'https://www.bankmellat.ir/help_user_vpos.aspx'));
                        },
                        child: Text(
                          'تکمیل خرید',
                          style: TextStyle(fontSize: 25),
                        ))
                  ],
                ),
              )
            ],
          );
        }
      } else {
        return CustomCircularProgressIndicator()
            .animate()
            .fade(duration: Duration(milliseconds: 300));
      }
    });
  }

  int getCartTotal(GetCartLoaded state) {
    int cartTotal = 0;
    for (var countedProduct in state.favoriteProducts) {
      cartTotal +=
          countedProduct.count * countedProduct.product.priceAfterDiscount;
    }
    return cartTotal;
  }
}
