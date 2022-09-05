import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Screen.dart';
import 'SplashView.dart';
class Splash{

  void IsLogin(BuildContext context){

    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user !=null){
      Timer(
          const Duration(seconds : 3),
              ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context )
          => MainScreen()
          )));
    }else{
      Timer(
          const Duration(seconds : 3),
              ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context )
          =>const View()
          )));
    }
  }


}