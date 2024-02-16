import 'package:flutter/material.dart';
import 'package:laundry/Constant/refactoring.dart';
import 'package:laundry/provider/loginprovider.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'home.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final FocusNode _pinPutFocusNode = FocusNode();
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
             Consumer<LoginProvider>(
               builder: (context,value,child) {
                 return PinFieldAutoFill(
                   controller: value.otpcontroller,
                   codeLength: 6,
                   focusNode: _pinPutFocusNode,
                   autoFocus: true,
                   keyboardType: TextInputType.number,
                   decoration: BoxLooseDecoration(
                     textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                     radius: Radius.circular(20),bgColorBuilder: const FixedColorBuilder(Colors.purple),
                     strokeColorBuilder: FixedColorBuilder(Colors.purple),
                   ),
                   onCodeChanged: (pin) {
                     value.verify(context);

                     // if (pin!.length == 6) {
                     //   PhoneAuthCredential phoneAuthCredential =
                     //   PhoneAuthProvider.credential(
                     //       verificationId: verificationId,
                     //       smsCode: pin);
                     //   signInWithPhoneAuthCredential(
                     //       context, phoneAuthCredential);
                     //   otpController.text = pin;
                     //   print(otpController.text+"ersgver");
                     //   setState(() {
                     //     Code = pin;
                     //   });
                     // }
                   },
                 );
               }
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
                 duration: 60,
               ),
             ),
             SizedBox(height: 280,),
             Consumer<LoginProvider>(
               builder: (context,value,child) {
                 return GestureDetector(
                     onTap: (){
                     },
                     child: button("Submit", height/17, width/2.5,));
               }
             ),
           ],
         ),
       ),


      ),
    );
  }
}
