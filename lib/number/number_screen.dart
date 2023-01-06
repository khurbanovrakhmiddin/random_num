import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled13/number/api_number.dart';
import 'package:untitled13/main.dart';

class Number extends StatefulWidget {
  const Number({Key? key}) : super(key: key);

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
  String data = "Loading";

  @override
  void initState() {
    super.initState();
  }

  void getData(String number) async {
    int res = int.parse(number);
    var result = await ApiNumber().getHttp(res);
    setState(() {
      data = result;
    });
  }

  Widget build(BuildContext context) {
    Map? args = ModalRoute.of(context)!.settings.arguments as Map;
    getData(args["number"]);
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
