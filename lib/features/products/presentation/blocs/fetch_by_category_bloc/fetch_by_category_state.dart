part of 'fetch_by_category_bloc.dart';

@immutable
sealed class FetchByCategoryState {}

class FetchByCategoryInitial extends FetchByCategoryState {}
class Loading extends FetchByCategoryState {}
class LoadSuccessful extends FetchByCategoryState {

  final List<ProductModel> productsList;

  LoadSuccessful(this.productsList);

}
class LoadFailed extends FetchByCategoryState {}
