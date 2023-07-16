import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injector/injector.dart';

import '/services/session_service.dart';
import 'constants.dart';



final dioInstance = addInterceptors(
  Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      baseUrl: apiUrl
    )
  )
);


final dioIntanceWithoutInterceptor = Dio(
  BaseOptions(
    baseUrl: apiUrl,
    connectTimeout: const Duration(seconds: 10),
    validateStatus: (status) {
      return status! < 500;
    },
  )
);


Dio addInterceptors(Dio dio) {
  final interceptors = Interceptors(
    sessionService: Injector.appInstance.get(),
  );
  return dio..interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, handler) => interceptors.requestInterceptor(options, handler),
    ),
  );
}

class Interceptors{

  final SessionService _sessionService;
  
  const Interceptors({
    required SessionService sessionService,
    
  }): _sessionService = sessionService;
  

  Future<void>  requestInterceptor(
    RequestOptions options,
    RequestInterceptorHandler handler
  ) async {
    final authModel = await _sessionService.getAuthModel();
    var token = authModel!.token;
    options.headers.addAll({HttpHeaders.authorizationHeader: "bearer $token"});
    return handler.next(options);
  }
  
}