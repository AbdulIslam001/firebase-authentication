import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Reuse_Button.dart';
import 'Utilities.dart';

class SignUp extends StatefulWidget {
  const SignUp ({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _auth =FirebaseAuth.instance;
  @override
  void dispose(){
    super.dispose();
    _email.dispose();
    _password.dispose();
  }
  @override
  bool loading = false;
  TextEditingController _password =TextEditingController();
  TextEditingController confirmpassword =TextEditingController();
  TextEditingController _email =TextEditingController();
  final _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title:const Text('SignUp'),
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
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child:const Text('Login'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 20,
                        width: 100,
                        decoration:const BoxDecoration(
                            color: Colors.indigo
                        ),
                        child:const Center(child:  Text('SignUp!',style: TextStyle(color: Colors.white))),
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
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    decoration:const InputDecoration(
                        hintText: 'Confirm Password'
                    ),
                    controller: confirmpassword,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Required';
                      }else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 50),
                  ReuseButton(
                      title: 'Sign Up',
                      loading: loading,
                      ontap: (){
                    if(_formkey.currentState!.validate()){
                      setState(() {
                        loading=true;
                      });
                      _auth.createUserWithEmailAndPassword(email: _email.text.toString(),
                          password: _password.text.toString()).then((value) => setState(() {
                        loading=false;
                      })).onError((error,
                          stackTrace) {
                        utilies().messege(error.toString());
                        setState(() {
                          loading=false;
                        });
                      });
                    }
                  }
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                       const Text('Already have an account?'),
                      const SizedBox(width: 20,),
                      GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child:const Text('Login',style: TextStyle(color: Colors.indigo
                          ),))
                    ],
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