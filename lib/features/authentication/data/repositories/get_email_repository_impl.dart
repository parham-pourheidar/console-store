import '../../domain/repositories/get_email_repository.dart';
import '../data_sources/remote/get_email_data_source.dart';

class GetEmailRepositoryImpl implements GetEmailRepository {
  final GetEmailDataSource getEmailDataSource;

  GetEmailRepositoryImpl(this.getEmailDataSource);

  @override
  Future<bool> call(String email) async {
    try {
      await getEmailDataSource(email);
      return true;
    } catch (e) {
      return false;
    }
  }
}
