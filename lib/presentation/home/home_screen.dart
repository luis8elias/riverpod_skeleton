import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/app/providers/providers.dart';
import '/tools/tools.dart';
import '/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

   static const String routeName = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionProv = ref.read(sessionProvider);
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Center(
          child: BasicButton(
            onPressed: () =>  sessionProv.logoutUser(),
            text: 'Cerrar sesión'
          ),
        ),
      ),
    );
  }
}