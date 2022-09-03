import 'package:flutter/material.dart';

class ReuseButton extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  bool loading =false;
    ReuseButton({Key? key ,required this.title ,
     required this.ontap,
   this.loading=false
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        child: Center(child:
            loading ? CircularProgressIndicator(
              strokeWidth: 3,
              color: Colors.white,
            ):
        Text(title,style:const TextStyle(color: Colors.white),)),
      ),
    );
  }
}
