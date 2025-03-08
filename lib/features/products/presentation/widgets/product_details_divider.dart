import 'package:flutter/material.dart';


class ProductDetailsDivider extends StatelessWidget {
  const ProductDetailsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 15,
      endIndent: 15,
      height: 12,
      thickness: 1.3,
      color: Colors.blueGrey,
    );
  }
}
