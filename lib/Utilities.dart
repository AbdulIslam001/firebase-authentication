
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class utilies{
  void messege(String error){
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}