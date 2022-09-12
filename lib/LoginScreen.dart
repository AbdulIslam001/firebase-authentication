
import'package:flutter/material.dart';

import 'SplashScreen.dart';

class Waiting extends StatefulWidget {
  const Waiting({Key? key}) : super(key: key);

  @override
  State<Waiting> createState() => _WaitingState();
}
Splash splash = Splash();
class _WaitingState extends State<Waiting> {
  @override
  void initState(){
    super.initState();
    splash.IsLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator(
        color: Colors.red,
        strokeWidth: 5,
      )),
    );
  }
}