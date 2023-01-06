import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_num/number/api_number.dart';
import 'package:random_num/random_trivia/random_screen.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final numController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: TextFormField(

            controller: numController,

            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(
                filled: true,
                labelText: 'Number',
                fillColor: Colors.white10,
                border: OutlineInputBorder()),
          ),
        ),
        TextButton(
            onPressed: () {

              if(numController.text.isNotEmpty){

                Navigator.pushNamed(context, '/num',

                    arguments: {"number": numController.text.toString()});
              }

            },
            child: const Text('Отримати факт')),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/random');
            },
            child: const Text('Отримати факт про випадкове число')),
        const Card(),
      ],
    ));
  }
}
