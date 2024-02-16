import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laundry/Admin/home.dart';
import 'package:laundry/Admin/mainpage.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

import '../Constant/myfunction.dart';
import '../Constant/refactoring.dart';

class Otp1 extends StatelessWidget {
  const Otp1({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80,left: 10),
                child: Text("Enter Your OTP",style: TextStyle(fontWeight:FontWeight.w700,fontSize: 25),),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Please enter the verification code send",style: TextStyle(fontSize:16,fontWeight:FontWeight.w400),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("to +91 8745632312",style: TextStyle(fontSize:16,fontWeight:FontWeight.w400),),
              ),
              SizedBox(height: 70,),
              Row(
                children: [
                  otpbox(65,60),
                  otpbox(65,60),
                  otpbox(65,60),
                  otpbox(65,60),
                ],
              ),
              SizedBox(height: 30,),
              Center(

                child: OtpTimerButton(
                  backgroundColor: Colors.white,
                  // controller: controller,
                  onPressed: () {},
                  text: Text('OTP auto resend in ',style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,fontSize: 16, ),),
                  duration: 30,
                ),
              ),
              SizedBox(height: 280,),
              GestureDetector(
                  onTap: (){
                    callNextReplacement(context, Mainpg1());
                  },
                  child: button("Submit", height/17, width/2.5,)),
            ],
          ),
        ),


      ),
    );
  }
}