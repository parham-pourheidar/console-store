import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:console_store/core/constants.dart';
import 'package:flutter/material.dart';

import '../features/authentication/presentation/screens/selector_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import 'di.dart';

class AppInitialize {
  static bool checkAuthStatus() {
    final session = Supabase.instance.client.auth.currentSession;
    return session != null;
  }

  static Widget getInitPage() {
    if (checkAuthStatus()) {
      return HomeScreen();
    } else {
      return SelectorScreen();
    }
  }

  Future<int> call() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await Supabase.initialize(
      url: Constants.supabaseInitUrl,
      anonKey: Constants.supabaseInitAnonKey,
    );
    DependencyInjection.setupLocator();


    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('theme_index') ?? 0;
  }
}
