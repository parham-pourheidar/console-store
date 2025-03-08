import 'package:supabase_flutter/supabase_flutter.dart';

class GetEmailDataSource {
  final SupabaseClient supabase;

  GetEmailDataSource(this.supabase);

  Future<void> call(String email) async {
    await supabase.auth.signInWithOtp(email: email);
  }
}
