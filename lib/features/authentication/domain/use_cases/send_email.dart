import '../repositories/get_email_repository.dart';

class SendEmail{
  final GetEmailRepository getEmailRepository;

  SendEmail(this.getEmailRepository);

  Future<bool> call(String email){
    return getEmailRepository(email);
  }

}