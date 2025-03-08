import '../repositories/verify_email_repository.dart';

class VerifyEmailRequest {
  VerifyEmailRepository verifyEmailRepository;

  VerifyEmailRequest(this.verifyEmailRepository);

  Future<bool> call(String token, String email) {
    return verifyEmailRepository(token, email);
  }
}
