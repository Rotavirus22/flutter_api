import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/common/localStrorage.dart';
import 'package:flutter_api/common/logregconst.dart';
import 'package:flutter_api/main.dart';

class LoginState extends ChangeNotifier {
  String? email;
  String? password;
  onEmailChanged(value) {
    email = value;
    notifyListeners();
  }

  onPasswordChanged(value) {
    password = value;
    notifyListeners();
  }

  bool isLoading = false;
  Dio dio = Dio();

  login() async {
    isLoading = true;
    notifyListeners();
    var data = {'email': email, 'password': password};
    print(data);
    try {
      var response =
          await dio.post('$logregApi/api/v1/users/login', data: data);
      localStorage.write("accessToken", response.data["accessToken"]);
      var accessTkn = localStorage.read("accessToken");
      print("This is saved accessToken:$accessTkn");
      navigatorKey.currentState!.pushReplacementNamed('/homeScreen');
    } on DioError catch (e) {
      print(e.response);
      print('error');
    }
    isLoading = false;
    notifyListeners();
  }
}
