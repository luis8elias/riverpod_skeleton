import '/data/enums/send_status.dart';
import '/data/models/auth_model.dart';
import '/presentation/login/models/login_model.dart';
import '/providers/form_provider.dart';
import '/providers/send_proivder.dart';
import '/services/services.dart';

class LoginProvider extends SendProvider<AuthModel> with FormProvider<LoginModel>{
 
  final LoginService _loginService;
  final SessionService _sessionService;

  LoginProvider({
    required LoginService loginService,
    required SessionService sessionService,
  })
  :
  _loginService = loginService,
  _sessionService = sessionService{
    formModel = LoginModel();
  }
  

  void tryLogin() async {
    applyStatus(SendStatus.loading);
    final loginResp = await _loginService.login(loginModel: formModel);
    if(loginResp.isFailed){
      message = loginResp.message!;
      return applyStatus(SendStatus.failed);
    }
    message = loginResp.message!;
    model = loginResp.model!;
    await _sessionService.saveAuthModel(authModel: loginResp.model!);
    return applyStatus(SendStatus.success);
  }



  @override
  void updateFormModel(LoginModel Function(LoginModel formModel) update) {
    super.updateFormModel(update);
    notifyListeners();
  }

}