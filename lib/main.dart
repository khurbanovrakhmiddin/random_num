import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_num/number/api_number.dart';
import 'package:random_num/random_trivia/random_screen.dart';

import 'home.dart';
import 'number/number_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
      print('build route for ${settings.name}');
      var routes = <String, WidgetBuilder>{

        '/': (context) => const MyHomePage(),
        '/num': (context) =>  Number(args: settings.arguments),
        '/random': (context) => const RandomScrren(),

      };
      WidgetBuilder? builder = routes[settings.name];
      return MaterialPageRoute(builder: (ctx) => builder!(ctx));
    },
    );
  }
}
