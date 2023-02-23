import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/Models/Screens/Home_screen/productsModel.dart';

class DetailState extends ChangeNotifier {
  DetailState() {
    getTeams();
  }
  TeamsData? teamsData;
  Dio dio = Dio();
  bool isLoading = false;
  getTeams() async {
    isLoading = true;
    notifyListeners();
    try {
      var response = await dio.get('https://myfakeapi.com/api/football/teams');
      teamsData = TeamsData.fromJson(response.data);
    } on DioError catch (e) {
      print(e.response);
      print('error');
    }
    isLoading = false;
    notifyListeners();
  }
}
