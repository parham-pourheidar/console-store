import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_cases/send_email.dart';

part 'get_email_event.dart';
part 'get_email_state.dart';

class GetEmailBloc extends Bloc<GetEmailEvent, GetEmailState> {
  GetEmailBloc() : super(InitState()) {
    final GetIt getIt = GetIt.instance;
    on<SendRequestToServer>((event, emit) async {
      SendEmail sendEmail = getIt<SendEmail>();
      emit(LoadingState());
      final bool result = await sendEmail(event.email);
      if (result == true) {
        emit(SentState());
      } else {
        emit(ErrorState());
      }
    });
  }
}
