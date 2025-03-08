import 'package:flutter/material.dart';
import 'package:console_store/core/app_initialize.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/cart/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'features/home/presentation/blocs/change_theme_bloc/change_theme_bloc.dart';
import 'features/home/presentation/blocs/logout_bloc/logout_bloc.dart';
import 'features/products/presentation/blocs/home_products_bloc/home_products_bloc.dart';
import 'features/products/presentation/blocs/tabs_bloc/tabs_bloc.dart';

void main() async {
  AppInitialize appInitialize = AppInitialize();
  final int themeIndex = await appInitialize();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => TabsBloc()),
      BlocProvider(create: (context) => HomeProductsBloc()..add(GetProducts())),
      BlocProvider(create: (context) => CartBloc()),
      BlocProvider(create: (context) => ChangeThemeBloc(themeIndex)),
      BlocProvider(create: (context) => LogoutBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeAnimationDuration: Duration(seconds: 1),
      theme: context.watch<ChangeThemeBloc>().state.currentTheme,
      home: AppInitialize.getInitPage(),
    );
  }
}
