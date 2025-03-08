import '../../domain/repositories/logout_repository.dart';
import '../data_sources/remote/logout_data_source.dart';

class LogoutRepositoryImpl implements LogoutRepository {
  final LogoutDataSource logoutDataSource;

  LogoutRepositoryImpl(this.logoutDataSource);

  @override
  Future<bool> call() async {
    try {
      await logoutDataSource();
      return true;
    } catch (e) {
      return false;
    }
  }
}
