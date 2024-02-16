import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laundry/Constant/myfunction.dart';
import 'package:laundry/User/login.dart';
import 'package:laundry/provider/Mainprovider.dart';
import 'package:provider/provider.dart';

import 'createac.dart';
import 'home.dart';

class Personal extends StatelessWidget {

  String userid;
  String name;
  String phone;
   Personal({super.key,required this.userid,required this.phone,required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:GestureDetector(
            onTap: (){
             callNextReplacement(context, Home(userid: userid,phone: phone,name: name,));
            },
            child: BackButton(color: Colors.black,)),
        title: Text("Personal Info",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 23,color: Colors.black),),
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Center(
              child: Consumer<LaundryProvider>(
                builder: (context,value,child) {
                  return Container(
                    height: 440,width: 330,decoration:BoxDecoration(
                      color: Color(0xff6F2DA8),borderRadius: BorderRadius.circular(12)
                  ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left:260,),
                            child: Consumer<LaundryProvider>(
                              builder: (context,value,child) {
                                return PopupMenuButton<String>(color: Colors.white,
                                    onSelected: (value1){
                                      print(value1+"666");
                                      value.editpersonalinfo(value.username, value.usernumber, value.userphoto);
                                      callNext(context, CreateAc(from: 'EDIT',loginuserid: userid,));
                                    },
                                    itemBuilder:(BuildContext context ){

                                      return[
                                        PopupMenuItem(
                                          child: Text("Edit"),
                                          value:"Edit",
                                        ),

                                      ];
                                    });
                              }
                            ),
                          ),

                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 70,
                                 backgroundImage: NetworkImage(value.userphoto),
                                )),

                          SizedBox(height: 20,),
                          Row(
                            children: [

                              Text("Name:",style: TextStyle(fontWeight: FontWeight.w600,fontSize:21,color: Colors.white),),
                              SizedBox(width: 20,),
                              Text(value.username,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [

                              Text("Phone:",style: TextStyle(fontWeight: FontWeight.w600,fontSize:20,color: Colors.white),),
                              SizedBox(width: 20,),
                              Text(value.usernumber,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Colors.white),),
                            ],
                          ),


                          SizedBox(height: 50,),
                          GestureDetector(
                            onTap: (){
                              FirebaseAuth auth=FirebaseAuth.instance;
                              auth.signOut();
                              callNextReplacement(context, Login());
                            },
                            child: Container(
                              height: 40,width: 100,
                              child: Center(child: Text("Logout",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),)),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.grey.shade800,spreadRadius: 2,blurRadius: 2)]),
                            ),
                          ),

                             SizedBox(height: 30,),
        ],
      ),
                    )
    );
                }
              )
          )
        ]
      )
    );
  }
}
