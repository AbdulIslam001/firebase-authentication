import 'package:flutter/material.dart';

import 'Reuse_Button.dart';
import 'SplashView.dart';

class VerificationScreen extends StatefulWidget {
  final  verificationcode;
  VerificationScreen({Key? key , required this.verificationcode }) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: TextFormField(),
              ),
              const SizedBox(
                height: 50,
              ),
              ReuseButton(title: 'verify', ontap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context)=>const View()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
