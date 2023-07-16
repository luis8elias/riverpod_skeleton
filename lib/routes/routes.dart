export  '/routes/redirect.dart';

import 'package:go_router/go_router.dart';

import '/presentation/presentation.dart';
import '/widgets/loaders.dart';


final routes =  [

  GoRoute(
    path: LoaderScreen.routeName,
    name: LoaderScreen.routeName,
    builder: (context, state) => const LoaderScreen(),
  ),

  GoRoute(
    path: LoginScreen.routeName,
    name: LoginScreen.routeName,
    builder: (context, state) => const LoginScreen(),
  ),

  GoRoute(
    path: HomeScreen.routeName,
    name: HomeScreen.routeName,
    builder: (context, state) => const HomeScreen(),
  )

];

