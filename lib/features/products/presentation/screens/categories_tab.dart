import 'package:flutter/material.dart';

import '../widgets/category_widget.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      spacing: 30,
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 30,
            children: [
              CategoryWidget(
                  text: 'کنسول ایکس باکس',
                  image: 'assets/images/categories/xbox_console.webp'),
              CategoryWidget(
                text: 'بازی ایکس باکس',
                image: 'assets/images/categories/xbox_game.webp',
              ),
              CategoryWidget(
                text: 'لوازم جانبی ایکس باکس',
                image: 'assets/images/categories/xbox_accessories.jpg',
              )
            ]),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 30,
            children: [
              CategoryWidget(
                text: 'کنسول پلی استیشن',
                image: 'assets/images/categories/ps_console.webp',
              ),
              CategoryWidget(
                text: 'بازی پلی استیشن',
                image: 'assets/images/categories/ps_game.jpg',
              ),
              CategoryWidget(
                text: 'لوازم جانبی پلی استیشن',
                image: 'assets/images/categories/ps_accessories.jpg',
              )
            ]),
      ],
    );
  }
}
