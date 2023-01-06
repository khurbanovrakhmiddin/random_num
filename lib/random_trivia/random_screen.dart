import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled13/random_trivia/random_api.dart';

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

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              data,
              style: TextStyle(fontSize: 35),
            ),
          ],
        ),
      ),
    );
  }
}
