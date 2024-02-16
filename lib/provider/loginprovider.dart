import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:laundry/provider/Mainprovider.dart';
import 'package:provider/provider.dart';

import '../Admin/mainpage.dart';
import '../Constant/myfunction.dart';
import '../User/bottomnavigation.dart';
import '../User/otp.dart';

class LoginProvider extends ChangeNotifier{

  FirebaseAuth auth=FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController phonenumbercontroller =TextEditingController();
  TextEditingController otpcontroller = TextEditingController();


  String  VerificationId ="";

  void sendotp(BuildContext context) async {
    print("kfjlvnw");
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${phonenumbercontroller.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);

        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
          backgroundColor: Colors.white,
          content: Text(
              "Verification Completed",
              style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.w800,)),
          duration:
          Duration(milliseconds: 3000),
        ));
        if(kDebugMode){}

      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
            content:
            Text("Sorry, Verification Failed"),
            duration: Duration(milliseconds: 3000),
          ));
          if (kDebugMode) {

          }
          print("provided phone number is invalid");
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        VerificationId = verificationId;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Otp(),
            ));
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
          backgroundColor: Colors.white,
          content: Text(
              "OTP sent to phone successfully",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600,)),
          duration:
          Duration(milliseconds: 3000),
        ));
        phonenumbercontroller.clear();
        log("Verification Id : $verificationId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }

  void verify(BuildContext context) async {
    print("111111111111111111111111111");
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId, smsCode: otpcontroller.text);

    print("credential = $credential"+VerificationId.toString());
    print("otpcontroller.text"+otpcontroller.text.toString());
    await auth.signInWithCredential(credential).then((value) {

      print("222222222222222222");
print(value);
      final user = value.user;
      if (user != null) {


        userAuthorized(user.phoneNumber, context);

      } else {
        if (kDebugMode) {
        }
      }


      });
  }
  String loginUserid='';
  Future<void> userAuthorized(String? phoneNumber, BuildContext context) async {

    String loginUsername='';
    String loginUsertype='';
    //String loginUserid='';
String userId ='';
    String loginphno="";
    String loginPhoto="";
    LaundryProvider mainProvider = Provider.of<LaundryProvider>(context, listen: false);

    try {
      var phone = phoneNumber!;
      print(phoneNumber.toString()+"duudud");
      print(phone.toString()+"duudud");
      db.collection("USERS").where("PHONE_NUMBER",isEqualTo:phone).get().then((value) {
        if(value.docs.isNotEmpty){
          print("fiifuif");
          for(var element in value.docs) {
            Map<dynamic, dynamic> map = element.data();
            loginUsername = map['NAME'].toString();
            loginUsertype = map['TYPE'].toString();
            loginphno=map["PHONE_NUMBER"].toString();
            loginUserid = map["CUSTOMER_ID"].toString();
            print('ggggggg${loginUserid}');
            userId = map["TYPEID"].toString();
            String uid = userId;
            print(loginUsertype);
            if (loginUsertype == "ADMIN") {

              print("cb bcb");
              callNextReplacement(context, Mainpg1(),);

            }

            else {
              print("mxnxn");

              print("dkdkdd");
              // mainProvider.getMakeupList();
              mainProvider.getType();
               print("wwwwwwwwwwwww");
             // mainProvider.getstatus(userId);
             print("tiiiickkkkkk"+mainProvider.tick.toString());
              callNextReplacement(context,Bottom(name: loginUsername,phone: loginphno,userid: loginUserid, ),);
              print("xxxxxxxxxxx");

            }
          }

        }
        else {
          const snackBar = SnackBar(
              backgroundColor: Colors.white,
              duration: Duration(milliseconds: 3000),
              content: Text("Sorry , You don't have any access",
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

      });


    } catch (e) {


      // const snackBar = SnackBar(
      //     backgroundColor: Colors.white,
      //     duration: Duration(milliseconds: 3000),
      //     content: Text("Sorry , Some Error Occurred",
      //       textAlign: TextAlign.center,
      //       softWrap: true,
      //       style: TextStyle(
      //           fontSize: 18,
      //           color: Colors.black,
      //           fontWeight: FontWeight.bold),
      //     ));
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
