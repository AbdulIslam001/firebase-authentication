import 'package:demo/Utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Reuse_Button.dart';
import 'Screen.dart';
import 'SplashView.dart';

class VerificationScreen extends StatefulWidget {
  final  verificationcode;
  VerificationScreen({Key? key , required this.verificationcode }) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final verifier =TextEditingController();
  final auth=FirebaseAuth.instance;
  bool loading =false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title:const Text('Verification Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: TextFormField(
                  controller: verifier,
                  decoration:const InputDecoration(
                    hintText: 'Enter otp code'
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ReuseButton(title: 'verify', loading: loading ,ontap: () async{
                setState(() {
                  loading =true;
                });
                final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationcode,
                    smsCode: verifier.text.toString());
                try{
                  setState(() {
                    loading =false;
                  });
                  await auth.signInWithCredential(credential);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                }catch(e){
                  setState(() {
                    loading =false;
                  });
                  utilies().messege(e.toString());
                }
            /*    if(verifier.text.toString()== widget.verificationcode){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                }else {
                  (e){
                  utilies().messege(e.toString());
                };
                } */
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
