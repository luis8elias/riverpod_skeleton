import 'dart:math';

import '/data/models/auth_model.dart';
import '/data/models/response_model.dart';
import '/presentation/login/models/login_model.dart';

class LoginService{

  const LoginService();

  Future<ResponseModel<AuthModel>> login({
    required LoginModel loginModel,
  })async{
    await Future.delayed(const Duration(seconds: 2));
    final fakeModel = AuthModel(
      token: 'token', refreshToken: 'refreshToken'
    );
    var randomNumber = Random().nextInt(2);
    return ResponseModel(
      success: randomNumber == 0,
      message: randomNumber == 0 ? 'Bienvenido ❤' : 'Credenciales incorrectas 😢',
      model: randomNumber == 0 ? fakeModel : null
    );
  }
}