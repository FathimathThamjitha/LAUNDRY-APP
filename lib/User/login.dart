
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laundry/Constant/refactoring.dart';
import 'package:provider/provider.dart';

import '../provider/loginprovider.dart';
import 'createac.dart';

class Login extends StatelessWidget {

  Login({super.key,});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
         body: 
        SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Align(child: Image.asset("assets/img_2.png",scale: 2,)),
              SizedBox(height: 10,),
              Align(alignment: Alignment.centerLeft,
             child: Padding(
               padding: const EdgeInsets.only(left:20),
               child: Text("Login",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 26),),
             )
              ),
              SizedBox(height: 20
                ,),
              Consumer<LoginProvider>(
                builder: (context,value,child,) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [BoxShadow(color: Colors.grey.shade400,blurRadius: 3)]
                    ),
                    child: SizedBox(
                      width:320,
                      child: TextFormField(keyboardType: TextInputType.number,
                        controller:value.phonenumbercontroller ,
                      decoration:
                      InputDecoration(focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                       borderSide: BorderSide(color: Colors.purple.shade700,)),
                        enabledBorder:border,
                        focusedErrorBorder: border,
                        errorBorder: border,
                        // OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                        //     borderSide: BorderSide(color: Colors.grey.shade400,)),


                           prefixIcon:Icon(Icons.call_outlined,color: Colors.grey.shade600,),
                          hintText: "Contact Number",hintStyle: TextStyle(color: Colors.grey.shade400,fontSize: 16,fontWeight: FontWeight.w400)
                      ),



                      ),
                    ),
                  );
                }
              ),

               SizedBox(height:155,),
               Consumer<LoginProvider>(
                 builder: (context,value,child) {
                   return GestureDetector(
                     onTap: (){
                       if(value.phonenumbercontroller.text.length==10&&value.phonenumbercontroller.text!='') {
                         value.sendotp(context);
                       }else{
                         ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                           backgroundColor: Colors.white,
                           content: Text(
                               "Enter Valid PhoneNumber",
                               style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w800,)),
                         ));
                       }

                     },
                       child: button("Login", height/19, width/2.5,));
                 }
               ),
              SizedBox(height: 30,),
              
              Padding(
                padding: const EdgeInsets.only(left: 218),
                child: CupertinoButton(
                    onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAc(from: "LOGIN" ,loginuserid: "",)));
                }, child: Text('Create account',style: TextStyle(color: Colors.blue.shade800),)


                ),
              )
            
            ],
            
          ),
        )

      ),
    );
  }
}
