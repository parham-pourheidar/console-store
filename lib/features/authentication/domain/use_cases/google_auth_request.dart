import '../repositories/google_auth_repository.dart';

class GoogleAuthRequest {
  final GoogleAuthRepository googleAuthRepository;

  GoogleAuthRequest(this.googleAuthRepository);

  Future<bool> call() {
    return googleAuthRepository();
  }
}
