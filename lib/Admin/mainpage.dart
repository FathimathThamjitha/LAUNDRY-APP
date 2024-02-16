

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laundry/Admin/bookings.dart';
import 'package:laundry/Admin/requests.dart';
import 'package:laundry/Admin/userlist.dart';
import 'package:laundry/Constant/myfunction.dart';
import 'package:laundry/provider/Mainprovider.dart';
import 'package:provider/provider.dart';
import '../Constant/refactoring.dart';
import '../User/login.dart';
import 'home.dart';


class Mainpg1 extends StatelessWidget {
  const Mainpg1({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xff6F2DA8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Consumer<LaundryProvider>(
                builder: (context,value,child) {
                  return InkWell(
                      onTap: (){
                        value.getCustomerdtls();
                        callNext(context, Requests());
                      },
                      child: button1("Requests", context,height/17,width/1.7));
                }
              ),
                SizedBox(height: 45,),
                Consumer<LaundryProvider>(
                  builder: (context,value,child) {
                    return InkWell(onTap: (){
                      value.getType();
                      // value.getLaundryCategory();
                      callNext(context, Home1());
                    },

                        child: button1("Laundry type", context,height/17,width/1.7));
                  }
                ),
                SizedBox(height: 45,),
                Consumer<LaundryProvider>(
                  builder: (context,value,child) {
                    return InkWell(
                        onTap: (){
                          value.getCustomerInfo();
                          callNext(context, Userlist());
                        },
                        child: button1("Users List", context,height/17,width/1.7));
                  }
                ),
                // SizedBox(height: 45,),
                // Consumer<LaundryProvider>(
                //   builder: (context,value,child) {
                //     return InkWell(
                //         // onTap: (){
                //         //   value.getWashType();
                //         //   callNext(context, Washing1(),);
                //         // },
                //         child: button1("Washing", context,height/17,width/1.7));
                //   }
                // ),



                SizedBox(height: 45,),
                Consumer<LaundryProvider>(
                  builder: (context,value,child) {
                    return InkWell(
                        onTap: (){
                          value.getPickupdtls();
                          callNext(context, Booking(),);
                        },
                        child: button1("Bookings", context,height/17,width/1.7));
                  }
                ),
                SizedBox(height:100,),

                Container(
                  child: GestureDetector(
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
                ),

              ]
                ),
          ),
        ),
      ),

    );
  }
}
