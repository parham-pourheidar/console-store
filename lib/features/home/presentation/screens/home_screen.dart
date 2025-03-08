import 'package:console_store/features/cart/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:console_store/features/products/presentation/blocs/tabs_bloc/tabs_bloc.dart';
import 'package:console_store/features/cart/presentation/screens/cart_tab.dart';
import 'package:console_store/features/products/presentation/screens/categories_tab.dart';
import 'package:console_store/features/products/presentation/screens/home_tab.dart';
import 'package:console_store/features/home/presentation/screens/settings_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static List<Widget> tabs = [
    SettingsTab(),
    CartTab(),
    CategoriesTab(),
    HomeTab(),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<CartBloc>(context).add(GetCart());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme themeColors = Theme.of(context).colorScheme;
    return BlocBuilder<TabsBloc, TabsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarColor: themeColors.surface,
            ),
          ),
          body: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: IndexedStack(
              key: ValueKey<int>(state.index),
              index: state.index,
              children: HomeScreen.tabs,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'تنظیمات'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_basket_rounded), label: 'سبد خرید'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_rounded), label: 'دسته بندی ها'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: 'خانه')
            ],
            selectedIconTheme:
                IconThemeData(color: themeColors.primary, size: 30),
            unselectedIconTheme:
                IconThemeData(color: themeColors.secondary, size: 25),
            selectedLabelStyle: TextStyle(
                color: themeColors.primary,
                fontSize: 26,
                fontWeight: FontWeight.w700),
            unselectedLabelStyle: TextStyle(
                color: themeColors.secondary,
                fontSize: 23,
                fontWeight: FontWeight.w600),
            selectedItemColor: themeColors.primary,
            unselectedItemColor: themeColors.secondary,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            currentIndex: state.index,
            onTap: (index) {
              BlocProvider.of<TabsBloc>(context).add(ChangeTab(index));
            },
          ),
        );
      },
    );
  }
}
