import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '/data/models/auth_model.dart';

class SessionService{

  final _authModelKey = 'AUTH_MODEL_KEY';
  final _storage = const FlutterSecureStorage();

  
  Future<void> saveAuthModel({required AuthModel authModel}) async {
    try {
      final encodedAuthModel = json.encode(authModel);
      await _storage.write(key: _authModelKey, value: encodedAuthModel);
    } catch (e) {
      log('🤡  $e');
      log('😭 Error en SessionService método [saveAuthModel]');
    }
  }


  Future<void> deletesAuthModel() async{
    try {
      await _storage.delete(key: _authModelKey);
    } catch (e) {
      log('🤡  $e');
      log('😭 Error en SessionService método [deletesAuthModel]');
    }
  }
  

  Future<AuthModel?> getAuthModel() async {
    try {
      final authModelStr = await _storage.read(key: _authModelKey);
      if (authModelStr == null || authModelStr == '') throw Exception();
      final authModelMap = json.decode(authModelStr);
      return AuthModel.fromJson(authModelMap);
    } catch (e) {
      log('🤡  $e');
      log('😭 Error en SessionService método [getAuthModel]');
      return null;
    }
  }
}