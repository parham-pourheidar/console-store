import '../../domain/repositories/google_auth_repository.dart';
import '../data_sources/remote/google_auth_data_source.dart';

class GoogleAuthRepositoryImpl implements GoogleAuthRepository {
  GoogleAuthDataSource googleAuthDataSource;

  GoogleAuthRepositoryImpl(this.googleAuthDataSource);

  @override
  Future<bool> call() async {
    try {
      await googleAuthDataSource();
      return true;
    } catch (e) {
      return false;
    }
  }
}
