import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/number_divider.dart';
import '../../../../core/widgets/snack_bar_display.dart';
import '../../../cart/presentation/blocs/cart_bloc/cart_bloc.dart';
import '../../domain/entities/product.dart';
import '../widgets/product_details_divider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    ColorScheme themeColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: themeColors.surface,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: product.image,
                  height: 380,
                  width: 350,
                ),
                ProductDetailsDivider(),
                Text(
                  product.title,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                ),
                ProductDetailsDivider(),
                Text(
                  product.description,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 28),
                ),
                ProductDetailsDivider(),
                ExpansionTile(
                  shape: Border.fromBorderSide(BorderSide.none),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'مشاهده توضیحات بیشتر',
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  expansionAnimationStyle: AnimationStyle(
                      duration: Duration(seconds: 1),
                      curve: FlippedCurve(Curves.easeInBack),
                      reverseCurve: FlippedCurve(Curves.easeIn)),
                  children: [
                    Text(
                      product.details,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                ProductDetailsDivider(),
                product.discount != 0
                    ? Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                              text: TextSpan(
                            text: dividePrice(product.price.toString()),
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontSize: 15),
                          )),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            padding: EdgeInsets.all(3),
                            child: Text(
                              '${product.discount} درصد تخفیف',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  color: themeColors.surface, fontSize: 18),
                            ),
                          )
                        ],
                      )
                    : SizedBox(),
                Row(
                  spacing: 7,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'تومان',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      dividePrice(product.priceAfterDiscount.toString()),
                      style: TextStyle(fontSize: 28),
                    ),
                    Text(
                      ':قیمت',
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                BlocConsumer<CartBloc, CartState>(
                  listener: (context, state) {
                    if (state is GetCartLoaded) {
                      snackBarDisplay(
                          context: context,
                          message: 'محصول با موفقیت به سبد خرید اضافه شد');
                    } else if (state is GetCartLoadFailed) {
                      snackBarDisplay(
                          context: context,
                          message: 'خطا در افزودن محصول به سبد خرید');
                    }
                  },
                  builder: (context, state) {
                    if (state is UpdatingCart) {
                      return ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blueGrey)),
                        child: Text(
                          'لطفا صبر کنید',
                          style: TextStyle(
                              fontSize: 30, color: themeColors.surface),
                        ),
                      );
                    }
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CartBloc>(context)
                            .add(AddToCart(product.id));
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.blueGrey)),
                      child: Text(
                        'افزودن به سبد خرید',
                        style:
                            TextStyle(fontSize: 30, color: themeColors.surface),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
