import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/presentation/login/providers/providers.dart';
import '/widgets/widgets.dart';


class StartButton extends ConsumerWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final provider = ref.watch(loginProvider);
    return SendProviderBuilder(
      provider: loginProvider,
      loaderWidget: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),
      child: BasicButton(
        onPressed: provider.isFormValid ?
        () => provider.tryLogin() 
        : null, 
        text: 'Iniciar'
      ),
    );
  }
}