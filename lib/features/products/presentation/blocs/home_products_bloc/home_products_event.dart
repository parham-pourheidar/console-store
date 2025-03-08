part of 'home_products_bloc.dart';

@immutable
sealed class HomeProductsEvent {}

class GetProducts extends HomeProductsEvent {}
