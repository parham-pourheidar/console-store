part of 'fetch_by_category_bloc.dart';

@immutable
sealed class FetchByCategoryEvent {}

class FetchProDuctsByCategory extends FetchByCategoryEvent {
  final String category;

  FetchProDuctsByCategory(this.category);
}
