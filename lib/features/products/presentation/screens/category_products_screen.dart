import 'package:console_store/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../blocs/fetch_by_category_bloc/fetch_by_category_bloc.dart';
import '../widgets/product_widget.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    ColorScheme themeColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: themeColors.surface,
        ),
      ),
      body: BlocBuilder<FetchByCategoryBloc, FetchByCategoryState>(
        builder: (context, state) {
          if (state is Loading) {
            return CustomCircularProgressIndicator();
          } else if (state is LoadFailed) {
            return Center(
              child: TextButton(
                  onPressed: () {
                    BlocProvider.of<FetchByCategoryBloc>(context)
                        .add(FetchProDuctsByCategory(category));
                  },
                  child: Text(
                    '! تلاش مجدد',
                    style: TextStyle(fontSize: 40),
                  )),
            );
          } else if (state is LoadSuccessful) {
            return GridView.builder(
              itemBuilder: (context, index) {
                ProductModel item = state.productsList[index];
                return ProductWidget(
                  product: item,
                );
              },
              itemCount: state.productsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.45,


              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
