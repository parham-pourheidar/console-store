part of 'get_email_bloc.dart';

@immutable
sealed class GetEmailEvent {}

class SendRequestToServer extends GetEmailEvent{
  final String email;

  SendRequestToServer(this.email);
}
