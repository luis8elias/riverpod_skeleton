

import 'package:flutter/material.dart';
import '/app/app_theme.dart';

class ThemeProvider extends  ChangeNotifier{

  ThemeData theme = lightTheme;

  void toggleTheme (){

    if(theme.brightness == Brightness.light){
      theme = darkTheme;
    }else{
      theme = lightTheme;
    }
    notifyListeners();
  }

}