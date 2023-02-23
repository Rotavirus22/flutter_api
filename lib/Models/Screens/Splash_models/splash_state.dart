import 'package:flutter/material.dart';
import 'package:flutter_api/Models/Screens/login_module/login_page.dart';
import 'package:flutter_api/common/localStrorage.dart';
import 'package:flutter_api/main.dart';

class SplashState extends ChangeNotifier {
  SplashState() {
    var accessTkn = localStorage.read("accessToken");
    Future.delayed(Duration(seconds: 2),(){
      goToNext();
    });
    
  }
  goToNext() {
    var accessTkn = localStorage.read("accessToken");
    if (accessTkn != null) {
      navigatorKey.currentState!
          .pushNamedAndRemoveUntil('/homeScreen', (route) => false);
    } else if (accessTkn == null) {
      navigatorKey.currentState!
          .pushNamedAndRemoveUntil(LoginPage.id, (route) => false);
    }
  }
}
