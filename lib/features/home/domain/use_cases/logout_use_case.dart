import '../repositories/logout_repository.dart';

class LogoutUseCase {
  LogoutRepository logoutRepository;

  LogoutUseCase(this.logoutRepository);

  Future<bool> call() {
    return logoutRepository();
  }
}
