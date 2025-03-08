import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogoutDataSource {
  final SupabaseClient supabase;
  final GoogleSignIn googleSignIn;

  LogoutDataSource(this.supabase, this.googleSignIn);

  Future<void> call() async {
    await googleSignIn.signOut();
    await supabase.auth.signOut();
  }
}
