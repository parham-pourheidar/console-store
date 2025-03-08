part of 'get_email_bloc.dart';

@immutable
sealed class GetEmailState {}

class InitState extends GetEmailState {}
class LoadingState extends GetEmailState {}
class SentState extends GetEmailState {}
class ErrorState extends GetEmailState {}
