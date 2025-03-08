import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../data/models/product_model.dart';
import '../../../domain/use_cases/home_products_use_case.dart';

part 'home_products_event.dart';
part 'home_products_state.dart';

class HomeProductsBloc extends Bloc<HomeProductsEvent, HomeProductsState> {
  HomeProductsBloc() : super(HomeProductsInitial()) {
    final GetIt getIt = GetIt.instance;
    on<GetProducts>((event, emit) async {
      emit(Loading());
      HomeProductsUseCase homeProductsUseCase = getIt<HomeProductsUseCase>();
      final result = await homeProductsUseCase();
      result.fold((error) => emit(LoadFailed()),
          (distinctProducts) => emit(LoadSuccessful(distinctProducts)));
    });
  }
}
