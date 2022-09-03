import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'SplashView.dart';

class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);
final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){
         auth.signOut().then((value){
           Navigator.push(context, MaterialPageRoute(
               builder: (context)=>const View()
           ));
         });
        }, icon:const Icon(Icons.logout_outlined)),
        centerTitle: true,
        title:const Text('Screen'),
      ),
    );
  }
}
