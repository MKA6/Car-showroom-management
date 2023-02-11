import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentcar/Screen/Home/Home.dart';

class Splash1 extends StatefulWidget {
  @override
  State<Splash1> createState() => _SplashLoadState();
}

class _SplashLoadState extends State<Splash1> {
  NavigatToScreen() {
    Future.delayed(Duration(seconds: 4)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NavigatToScreen();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: Color(0xff3F657B),
          body: Center(
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }
}
