import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '/app/providers/providers.dart';
import '/presentation/presentation.dart';
import '/widgets/loaders.dart';


FutureOr<String?> redirect(
  BuildContext context, 
  GoRouterState goRouterState,
  WidgetRef ref
){

  final providerRoute = ref.watch(sessionProvider).state.route;

  if (goRouterState.location == providerRoute) {
    return null;
  }

  final provStateRoutes = [
    LoaderScreen.routeName,
    LoginScreen.routeName,
    HomeScreen.routeName,
  ];
  if (provStateRoutes.contains(goRouterState.location)) {
    return providerRoute;
  }
  return null;
}