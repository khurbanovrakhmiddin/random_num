import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled13/main.dart';

class ApiNumber {
  ApiNumber();


  Future getHttp(int number) async {
    // int number = int.parse(MyHomePageState().numController.text.trim().toString());
    var response = await Dio().get('http://numbersapi.com/$number');
    String postss = response.data;
    print('122 ');
    return postss;
  }
}
