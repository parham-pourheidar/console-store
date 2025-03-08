import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:console_store/core/constants.dart';

class GoogleAuthDataSource {
  final SupabaseClient supabaseClient;
  final GoogleSignIn googleSignIn;

  GoogleAuthDataSource(this.supabaseClient, this.googleSignIn);

  Future<void> call() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    await supabaseClient.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: googleAuth.idToken!,
    );

    if (supabaseClient.auth.currentSession == null) {
      throw Exception('error occurred');
    }
  }
}
