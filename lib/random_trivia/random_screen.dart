import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_num/random_trivia/random_api.dart';

class RandomScrren extends StatefulWidget {
  const RandomScrren({Key? key}) : super(key: key);

  @override
  State<RandomScrren> createState() => _RandomScrrenState();
}

class _RandomScrrenState extends State<RandomScrren> {
  String data = "Loading";

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var result = await ApiRandom().getHttp();
    setState(() {
      data = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              data,
              style:const TextStyle(fontSize: 35),
            ),
          ],
        ),
      ),
    );
  }
}
