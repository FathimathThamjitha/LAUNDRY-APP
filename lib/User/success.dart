import 'package:flutter/material.dart';

import 'orderdtls.dart';

class Success extends StatelessWidget {
  String userid;
  String name;
  String phone;
  Success({super.key,required this.name,required this.phone,required this.userid});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left:50,top: 250),
        child: Column(

          children: [
            Image.asset("assets/img_18.png",scale:2.1,),
            SizedBox(height: 20,),
            Text("Payment Succesful!",style: TextStyle(color: Colors.purple.shade900,fontWeight: FontWeight.w500,fontSize: 29),),
        SizedBox(height: 120,),
        GestureDetector(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Order(phone: phone,userid: userid,name: name,)));
        },
          child: Container(
            height: height/19,
            width: width/1.6,
            decoration: BoxDecoration(
                color: Colors.purple.shade50,
                border:
                Border.all(color: Colors.white.withOpacity(0)),borderRadius: BorderRadius.circular(10)),
            child:Center(child: Text("Show My Order",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),))
          ),
        ),

          ],
        ),
      ),

    );
  }
}
