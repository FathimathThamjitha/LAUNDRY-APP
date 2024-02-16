import 'package:flutter/material.dart';

class Failed extends StatelessWidget {
  const Failed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.only(left:50,top: 250),
        child: Column(
          children: [
            Image.asset("assets/img_19.png"),
            SizedBox(height:20,),
            Text("Payment Failed!",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.red.shade800),)
          ],
        ),
      ),
    );
  }
}
