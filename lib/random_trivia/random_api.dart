import 'package:dio/dio.dart';


class ApiRandom {

 static Future getHttp() async {
    var response = await Dio().get('http://numbersapi.com/random/trivia');
    String postss = response.data;
    print(response);
    return postss;
  }
}
