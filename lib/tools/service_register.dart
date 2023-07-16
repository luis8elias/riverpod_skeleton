import 'package:injector/injector.dart';

import '/services/services.dart';


class ServiceRegister{

  static void start(){
    Injector.appInstance.registerSingleton<LoginService>(
      LoginService.new
    );
    Injector.appInstance.registerSingleton<SessionService>(
      SessionService.new
    );
  }

}