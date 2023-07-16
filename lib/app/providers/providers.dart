export '/app/providers/theme_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injector/injector.dart';

import '/app/providers/session_provider.dart';
import '/app/providers/theme_provider.dart';


final themeProvider = ChangeNotifierProvider<ThemeProvider>((ref) {
  return ThemeProvider();
});



final sessionProvider = ChangeNotifierProvider<SessionProvider>((ref) {
  return SessionProvider(
    sessionService: Injector.appInstance.get()
  )..checkIfUserIsAuthenticated();
});