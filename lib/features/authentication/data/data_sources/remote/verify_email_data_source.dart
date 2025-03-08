import 'package:supabase_flutter/supabase_flutter.dart';

class VerifyEmailDataSource {
  final SupabaseClient supabase;

  VerifyEmailDataSource(this.supabase);

  Future<void> call(String token, String email) async {
    await supabase.auth
        .verifyOTP(type: OtpType.email, token: token, email: email);
  }
}
