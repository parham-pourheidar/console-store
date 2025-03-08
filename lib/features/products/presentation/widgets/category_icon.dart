import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/fetch_by_category_bloc/fetch_by_category_bloc.dart';
import '../screens/category_products_screen.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => FetchByCategoryBloc()
                        ..add(FetchProDuctsByCategory(title)),
                      child: CategoryProductsScreen(
                        category: title,
                      ),
                    )));
          },
          child: SizedBox(
            height: 55,
            width: 55,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: Image.asset(image),
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        )
      ],
    );
  }
}
