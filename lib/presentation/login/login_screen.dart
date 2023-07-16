import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/app/providers/providers.dart';
import '/tools/tools.dart';
import '/widgets/widgets.dart';
import '/presentation/login/providers/providers.dart';
import '/presentation/login/widgets/password_input.dart';
import '/presentation/login/widgets/start_button.dart';


class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionProv = ref.read(sessionProvider);
    return Scaffold(
      body : SendProviderListener(
        provider: loginProvider,
        onError: (error) => SnackbarHelper.show(context,error),
        onSuccess: (model, message) {
          SnackbarHelper.show(context,message);
          sessionProv.checkIfUserIsAuthenticated();
        },
        child: const _LoginScreenUI(),
      )
    );
  }
}



class _LoginScreenUI extends ConsumerWidget {
  const _LoginScreenUI();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(loginProvider);
    return SafeArea(  
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: kPadding * 2,
              ),
              SizedBox(
                width: double.infinity,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.food_bank,
                    color: Theme.of(context).primaryColor,
                    size: 60,
                  )
                ),
              ),
              const SizedBox(
                height: kPadding * 2,
              ),
              Text(
                'Iniciar Sesión',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).primaryColor
                ),
              ),
              const SizedBox(
                height: kPadding * 2,
              ),
              BasicInput(
                label: 'Correo electrónico',
                validator: (value) => ValidateHelper.validateEmail(value!.trim()),
                onChanged: (value) => provider.updateFormModel((model) => model.copyWith(
                  email: value.trim()
                )),
              ),
              const SizedBox(
                height: kPadding,
              ),
              PasswordInput(
                label: 'Contraseña',
                onChanged: (value) => provider.updateFormModel((model)=> model.copyWith(
                  password: value
                )),
                validator: (value) => ValidateHelper.validateRequired(value),
              ),
              const SizedBox(
                height: kPadding * 2,
              ),
              const StartButton()
            ],
          ),
        ),
      )
    );
  }
}