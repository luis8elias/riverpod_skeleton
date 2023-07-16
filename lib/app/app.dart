import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:injector/injector.dart';

import '/app/providers/providers.dart';
import '/routes/routes.dart';
import '/widgets/loaders.dart';




class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final themeProv = ref.watch(themeProvider);
    final sessionProv = ref.read(sessionProvider);

    if (!Injector.appInstance.exists<GoRouter>()) {
      Injector.appInstance.registerSingleton<GoRouter>(() {
        return GoRouter(
          debugLogDiagnostics: true,
          routes: routes,
          initialLocation: LoaderScreen.routeName,
          refreshListenable: sessionProv,
          redirect: (context, state) => redirect(context, state, ref),
        );
      });
    }
    return MaterialApp.router(
      title:'Riverpod Skeleton',
      debugShowCheckedModeBanner: true,
      theme: themeProv.theme,
      routeInformationProvider: Injector.appInstance.get<GoRouter>().routeInformationProvider,
      routeInformationParser: Injector.appInstance.get<GoRouter>().routeInformationParser,
      routerDelegate: Injector.appInstance.get<GoRouter>().routerDelegate,
    );
  }
}