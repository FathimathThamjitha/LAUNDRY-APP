import 'package:flutter/material.dart';
import 'package:laundry/provider/Mainprovider.dart';
import 'package:provider/provider.dart';

import 'mainpage.dart';

class Userlist extends StatelessWidget {
  const Userlist({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading:GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Mainpg1()));
            },
            child: BackButton(color: Colors.black,)),
        title: Text("Users List",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 23,color: Colors.black),),
      ),
         body: Consumer<LaundryProvider>(
           builder: (context,value,child) {
             print("dfghjk"+value.CustList.toString());
             return value.CustList.isNotEmpty ?

           value.getCustomerLoader?Center(child: CircularProgressIndicator(color:Color(0xff6F2DA8),)):ListView.builder(

                 itemCount: value.CustList.length,
                 itemBuilder: (context, index) {
                   var items = value.CustList[index];

                   return Container(
                     margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                     height:100,
                     width: width,
                     decoration: BoxDecoration(color: Color(0xff6F2DA8),
                       borderRadius: BorderRadius.circular(8),
                     ),
                     child: Column(
                       children: [
                         Row(
                           children: [


                             Padding(
                               padding: EdgeInsets.only(left: 14, top: 8),
                               child: Text("Name:", style: TextStyle(fontSize: 18,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.white),),
                             ),
                             SizedBox(width: 10,),
                             Padding(
                               padding: EdgeInsets.only(top: 8),
                               child: Text(items.name, style: TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.white),),
                             ),
                           ],
                         ),
                         Row(
                           children: [
                             Padding(
                               padding: EdgeInsets.only(left: 14, top: 7),
                               child: Text("Phone No:", style: TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.white),),
                             ),
                             SizedBox(width: 10,),
                             Padding(
                               padding: EdgeInsets.only(top: 8),
                               child: Text(items.phone, style: TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.white),),
                             ),
                           ],
                         ),
                       ],
                     ),
                   );
                 }
             ):
                 Center(child: Text("empty....."));

             }

         ),

    );
  }
}
