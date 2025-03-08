import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/fetch_by_category_bloc/fetch_by_category_bloc.dart';
import '../screens/category_products_screen.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.text,
    required this.image,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    ColorScheme themeColors = Theme.of(context).colorScheme;
    return Column(
      spacing: 3,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => FetchByCategoryBloc()
                        ..add(FetchProDuctsByCategory(text)),
                      child: CategoryProductsScreen(
                        category: text,
                      ),
                    )));
          },
          child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: themeColors.primary.withAlpha(200),
                  blurRadius: 10,
                  spreadRadius: 0.8,
                )
              ], borderRadius: BorderRadius.all(Radius.circular(25))),
              width: 160,
              height: 150,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ))),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: themeColors.primary),
        ),
      ],
    ).animate().scale(duration: Duration(milliseconds: 300));
  }
}
