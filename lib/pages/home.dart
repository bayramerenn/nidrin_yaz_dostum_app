import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nidrin_yaz_dostum_app/util/app_constant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimeOut();
  }

  startTimeOut() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, route);

    // Future.delayed(Duration(seconds: 3), () {
    //   Navigator.of(context).pushReplacementNamed(AppConstant.pageChooseSecond);
    // });
  }

  route() {
    Navigator.of(context).pushReplacementNamed(AppConstant.pageChooseSecond);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
