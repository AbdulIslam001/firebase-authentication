import 'package:demo/Reuse_Button.dart';
import 'package:demo/Utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'VerifyScreen.dart';

class SignWithNumber extends StatelessWidget {
  const SignWithNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final verifer =TextEditingController();
    final auth= FirebaseAuth.instance;
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
                child: TextFormField(
                  controller:verifer,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ReuseButton(title: 'Login', ontap: (){
                auth.verifyPhoneNumber(
                  phoneNumber:verifer.text ,
                    verificationCompleted: (_){},
                    verificationFailed: (e){
                    utilies().messege(e.toString());
                    },
                    codeSent: (String verificationcode , int? token){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>VerificationScreen(verificationcode: verificationcode,)));
                    },
                    codeAutoRetrievalTimeout: (e){
                      utilies().messege(e.toString());
                    },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}