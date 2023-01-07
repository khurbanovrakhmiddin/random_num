import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:random_num/main.dart';

class ApiNumber {
  static Future getHttp(int number) async {
    var response = await Dio().get('http://numbersapi.com/$number');
    String postss = response.data;
    return postss;
  }
}
