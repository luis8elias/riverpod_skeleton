export '/presentation/login/providers/login_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injector/injector.dart';

import '/presentation/login/providers/login_provider.dart';


final loginProvider = ChangeNotifierProvider<LoginProvider>((ref) {
  return LoginProvider(
    loginService: Injector.appInstance.get(),
    sessionService: Injector.appInstance.get()
  );
});
