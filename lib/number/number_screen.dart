import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_num/number/api_number.dart';
import 'package:random_num/main.dart';

class Number extends StatefulWidget {
  final Object? args;
  const Number({Key? key, required this.args}) : super(key: key);

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
  String data = "Loading";

  @override
  void initState() {

    super.initState();
    Map? args = widget.args as Map;
    getData(args["number"]);

  }

  void getData(String number) async {
    int res = int.parse(number);
    var result = await ApiNumber().getHttp(res);
      data = result;
      setState(() {

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
              style: TextStyle(fontSize: 35),
            ),
          ],
        ),
      ),
    );
  }
}
