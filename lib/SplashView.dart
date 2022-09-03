
import 'package:demo/Utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Reuse_Button.dart';
import 'Screen.dart';
import 'Sign_Up.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  bool loading = false;
  final _auth =FirebaseAuth.instance;
  TextEditingController _password =TextEditingController();
  TextEditingController _email =TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose(){
    super.dispose();
    _email.dispose();
    _password.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title:const Text('Login'),
        centerTitle: true,
        automaticallyImplyLeading: false,),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 100,
                        decoration:const BoxDecoration(
                          color: Colors.indigo
                        ),
                        child:const Center(child:  Text('Login',style: TextStyle(color: Colors.white))),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>SignUp()));
                        },
                        child: Container(
                          child:const Text('SignUp!'),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.2,
                  ),
                  TextFormField(
                    decoration:const InputDecoration(
                      hintText: 'Emial'
                    ),
                    controller: _email,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Required';
                      }else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    decoration:const InputDecoration(
                        hintText: 'Password'
                    ),
                    controller: _password,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Required';
                      }else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 50),
                  ReuseButton(title: 'Login',
                      loading: loading,
                      ontap: (){
                    if(_formkey.currentState!.validate()){
                      setState(() {
                        loading=true;
                      });
                      _auth.signInWithEmailAndPassword(email: _email.text.toString(), password: _password.text.toString()).then((value) {
                        setState(() {
                          loading=false;
                        });
                        utilies().messege(value.user!.displayName.toString());
                      Navigator.push(context, MaterialPageRoute(builder: (context)
                      => MainScreen()));
                      }).onError((error, stackTrace){
                        setState(() {
                          loading=false;
                        });
                        utilies().messege(error.toString());
                      });
                    }

                  }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}