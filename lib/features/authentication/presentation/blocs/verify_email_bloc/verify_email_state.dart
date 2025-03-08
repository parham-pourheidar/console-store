part of 'verify_email_bloc.dart';

@immutable
sealed class VerifyEmailState {}

class InitialState extends VerifyEmailState {}
class VerifyRequesting extends VerifyEmailState{}
class TokenRight extends VerifyEmailState{}
class TokenWrong extends VerifyEmailState{}

