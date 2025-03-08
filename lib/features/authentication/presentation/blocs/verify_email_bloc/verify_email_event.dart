part of 'verify_email_bloc.dart';

@immutable
sealed class VerifyEmailEvent {}

class VerifyRequest extends VerifyEmailEvent{
  final String token;
  final String email;

  VerifyRequest(this.token, this.email);
}
