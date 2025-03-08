import '../../domain/repositories/verify_email_repository.dart';
import '../data_sources/remote/verify_email_data_source.dart';

class VerifyEmailRepositoryImpl implements VerifyEmailRepository {
  VerifyEmailDataSource verifyEmailDataSource;

  VerifyEmailRepositoryImpl(this.verifyEmailDataSource);

  @override
  Future<bool> call(String token, String email) async {
    try {
      await verifyEmailDataSource(token, email);
      return true;
    } catch (e) {
      return false;
    }
  }
}
