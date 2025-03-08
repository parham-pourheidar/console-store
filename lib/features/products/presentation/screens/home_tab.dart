import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../blocs/home_products_bloc/home_products_bloc.dart';
import '../widgets/category_icon.dart';
import '../widgets/products_slider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme themeColors = Theme.of(context).colorScheme;
    return Center(
      child: BlocBuilder<HomeProductsBloc, HomeProductsState>(
          builder: (context, state) {
        if (state is Loading) {
          return CustomCircularProgressIndicator();
        } else if (state is LoadFailed) {
          return Center(
            child: TextButton(
                onPressed: () {
                  BlocProvider.of<HomeProductsBloc>(context).add(GetProducts());
                },
                child: Text(
                  '! تلاش مجدد',
                  style: TextStyle(fontSize: 40),
                )),
          );
        } else if (state is LoadSuccessful) {
          return SingleChildScrollView(
            child: Column(
              spacing: 15,
              children: [
                SizedBox(),
                Text(
                  'فروشگاه کنسول استور',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: themeColors.primary),
                ),
                ImageSlideshow(
                    initialPage: 0,
                    isLoop: true,
                    autoPlayInterval: 4000,
                    height: 250,
                    width: double.infinity,
                    children: [
                      Image.asset('assets/images/home/banner1.jpeg',
                          fit: BoxFit.fill),
                      Image.asset('assets/images/home/banner2.webp',
                          fit: BoxFit.fill),
                      Image.asset('assets/images/home/banner3.webp',
                          fit: BoxFit.fill),
                      Image.asset('assets/images/home/banner4.webp',
                          fit: BoxFit.fill),
                      Image.asset('assets/images/home/banner5.webp',
                          fit: BoxFit.fill),
                      Image.asset('assets/images/home/banner6.jpeg',
                          fit: BoxFit.fill),
                    ]),
                ProductsSlider(
                  productsList: state.distinctProducts['discountedProducts']!,
                  color: Colors.red,
                  title: 'محصولات  تخفیف خورده',
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CategoryIcon(
                      image: 'assets/images/category_icons/ps_console.webp',
                      title: 'کنسول پلی استیشن',
                    ),
                    CategoryIcon(
                      image: 'assets/images/category_icons/ps_game.webp',
                      title: 'بازی پلی استیشن',
                    ),
                    CategoryIcon(
                      image: 'assets/images/category_icons/ps_accessories.webp',
                      title: 'لوازم جانبی پلی استیشن',
                    ),
                  ],
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CategoryIcon(
                      image: 'assets/images/category_icons/x_console.webp',
                      title: 'کنسول ایکس باکس',
                    ),
                    CategoryIcon(
                      image: 'assets/images/category_icons/x_game.webp',
                      title: 'بازی ایکس باکس',
                    ),
                    CategoryIcon(
                      image:
                          'assets/images/category_icons/xbox_accessories.webp',
                      title: 'لوازم جانبی ایکس باکس',
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                ProductsSlider(
                  productsList: state.distinctProducts['psGameProducts']!,
                  color: Colors.blue,
                  title: 'بازی پلی استیشن',
                ),
                ProductsSlider(
                  productsList:
                      state.distinctProducts['xboxAccessoryProducts']!,
                  color: Colors.green,
                  title: 'لوازم جانبی ایکس باکس',
                ),
              ],
            ),
          );
        }
        return Center();
      }),
    );
  }
}
