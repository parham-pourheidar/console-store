import 'package:bloc/bloc.dart';
import 'package:console_store/features/products/data/models/product_model.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_cases/fetch_by_category_use_case.dart';

part 'fetch_by_category_event.dart';
part 'fetch_by_category_state.dart';

class FetchByCategoryBloc
    extends Bloc<FetchByCategoryEvent, FetchByCategoryState> {
  FetchByCategoryBloc() : super(FetchByCategoryInitial()) {
    final GetIt getIt = GetIt.instance;
    on<FetchProDuctsByCategory>((event, emit) async {
      emit(Loading());
      FetchByCategoryUseCase fetchByCategoryUseCase =
          getIt<FetchByCategoryUseCase>();
      final result = await fetchByCategoryUseCase(event.category);
      result.fold((error) => emit(LoadFailed()),
          (productsList) => emit(LoadSuccessful(productsList)));
    });
  }
}
