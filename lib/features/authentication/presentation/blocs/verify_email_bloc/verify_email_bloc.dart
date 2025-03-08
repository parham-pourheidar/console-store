import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/use_cases/verify_email_request.dart';

part 'verify_email_event.dart';
part 'verify_email_state.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  VerifyEmailBloc() : super(InitialState()) {
    final GetIt getIt = GetIt.instance;
    on<VerifyRequest>((event, emit) async {
      emit(VerifyRequesting());
      VerifyEmailRequest verifyEmailRequest = getIt<VerifyEmailRequest>();
      final result = await verifyEmailRequest(event.token, event.email);

      if (result == true) {
        emit(TokenRight());
      } else {
        emit(TokenWrong());
      }
    });
  }
}
