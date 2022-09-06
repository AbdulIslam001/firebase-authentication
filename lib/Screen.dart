import 'package:demo/Reuse_Button.dart';
import 'package:demo/Utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'SplashView.dart';

class MainScreen extends StatefulWidget {
   MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
final auth = FirebaseAuth.instance;
final loading=false;
final post = TextEditingController();

final databaseref = FirebaseDatabase.instance.ref('Posts');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){
         auth.signOut().then((value){
           Navigator.push(context, MaterialPageRoute(
               builder: (context)=>const View()
           ));
         }).onError((error, stackTrace){
           utilies().messege(error.toString());
         });
        }, icon:const Icon(Icons.logout_outlined)),
        centerTitle: true,
        title:const Text('Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: post,
              maxLines: 5,
              decoration:const  InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter any thing'
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ReuseButton(title: "Save",loading: loading ,ontap: (){
              databaseref.child('1').set({
                'id':1 ,
                'title' : post.text.toString()
              }).then((value) {
                utilies().messege("Post added to database");
              }).onError((error, stackTrace) {
                utilies().messege(error.toString());
              });
            })
          ],
        ),
      ),
    );
  }
}
