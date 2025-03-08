import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_cases/logout_use_case.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    final GetIt getIt = GetIt.instance;
    on<LogoutRequest>((event, emit) async {
      emit(LogoutLoading());
      LogoutUseCase logoutUseCase = getIt<LogoutUseCase>();
      final result = await logoutUseCase();
      result ? emit(LogoutSuccessful()) : emit(LogoutFailed());
    });
  }
}
