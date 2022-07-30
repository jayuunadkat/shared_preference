import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preference/Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: demo1(),
  ));
}

class demo1 extends StatefulWidget {
  const demo1({Key? key}) : super(key: key);

  @override
  State<demo1> createState() => _demo1State();
}

class _demo1State extends State<demo1> {
  int? cnt;

  bool status = false;

  @override
  void initState() {
    super.initState();
    initPref();
  }

  initPref() async {
    Model.prefs = await SharedPreferences.getInstance();
    cnt = Model.prefs!.getInt("abc") ?? 0;
    status = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: status
            ? Column(
          children: [
            Text(
              "$cnt",
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(onPressed: () {

              cnt=(cnt)!+1;
              Model.prefs!.setInt('abc', cnt!);
              setState(() {

              });
            }, child: Text("Increment"))
          ],
        )
            : Center(
          child: CircularProgressIndicator(),
        ));
  }
}
