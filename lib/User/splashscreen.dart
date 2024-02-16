import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constant/myfunction.dart';
import '../provider/loginprovider.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  String userid;
  String name;
  String phone;
  SplashScreen({super.key,required this.name,required this.phone,required this.userid});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    LoginProvider loginProvider =
    Provider.of<LoginProvider>(context, listen: false);
    // LaundryProvider mainProvider =
    // Provider.of<LaundryProvider>(context, listen: false);
    // mainProvider.getMakeupList();

    FirebaseAuth auth = FirebaseAuth.instance;
    var loginUser = auth.currentUser;



    Timer( Duration(seconds: 5), () {
      print("hjkl"+loginUser.toString());
      if(loginUser==null){
        callNextReplacement(context, Login());
      }else{
        loginProvider.userAuthorized(loginUser.phoneNumber, context);

      }
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img_27.png"),
                    fit: BoxFit.fill)),
            child: Center(child:  Padding(
              padding: const EdgeInsets.only(top:300),
              child: Column(
                children: [
                  Text("Laundry Loft",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w900),),
                  Text("Let It Bubble",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17),),
                ],
              ),
            ),
            ),
          ),

        ],
      ),
    );
  }
}
