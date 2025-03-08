abstract class VerifyEmailRepository {
  Future<bool> call(String token, String email);
}
