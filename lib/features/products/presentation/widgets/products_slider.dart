import 'package:console_store/features/products/data/models/product_model.dart';
import 'package:console_store/features/products/presentation/widgets/slider_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProductsSlider extends StatelessWidget {
  const ProductsSlider(
      {super.key,
      required this.productsList,
      required this.color,
      required this.title});

  final List<ProductModel> productsList;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    ColorScheme themeColors = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.fromLTRB(8, 0, 10, 0),
      color: color,
      height: 300,
      width: double.infinity,
      child: Column(spacing: 5, children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            title,
            style: TextStyle(fontSize: 28, color: themeColors.surface),
          ),
        ),
        SizedBox(
          height: 250,
          width: double.infinity,
          child: ListView.builder(
            reverse: true,
            itemBuilder: (context, index) {
              return SliderProductWidget(
                product: productsList[index],
              );
            },
            itemCount: productsList.length,
            scrollDirection: Axis.horizontal,
          )
              .animate()
              .slideX(duration: Duration(milliseconds: 700))
              .then()
              .shimmer(duration: Duration(seconds: 2)),
        ),
      ]),
    );
  }
}
