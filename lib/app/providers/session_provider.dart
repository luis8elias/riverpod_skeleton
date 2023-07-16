import 'dart:developer';

import 'package:flutter/material.dart';
import '/data/enums/session_status.dart';
import '/services/session_service.dart';

class SessionProvider extends  ChangeNotifier{
  final SessionService _sessionService;
  SessionProvider({required SessionService sessionService})
  :_sessionService = sessionService;



  SessionState state = SessionState.loading;

  

  void _applyState(SessionState newState){
    if(state == newState){
      return;
    }
    log('[SessionStateUpdate✨] prevState: [${state.name}] => newState: [${newState.name}]');
    state = newState;
    notifyListeners();
  }



  Future<void> checkIfUserIsAuthenticated() async{
    final authModel = await _sessionService.getAuthModel();
    if (authModel == null) {
      return _applyState(SessionState.unauthenticatedUser);
    }
    return _applyState(SessionState.authenticatedUser);
  }



  Future<void> logoutUser() async{
    await _sessionService.deletesAuthModel();
    return _applyState(SessionState.unauthenticatedUser);
  }

}