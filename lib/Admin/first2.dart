import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../Constant/myfunction.dart';
import '../Constant/refactoring.dart';
import '../User/login.dart';

class First1 extends StatelessWidget {
  const First1({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.topLeft,height: height,width: width,
      decoration: BoxDecoration(image: DecorationImage(image:AssetImage("assets/img.png",),
          fit: BoxFit.fitWidth,alignment: Alignment.center
      )
      ),



      child: Scaffold(backgroundColor: Colors.transparent,
        body:
        Center(
          child: Padding(
            padding:  EdgeInsets.only(top:20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(top: 140),
                  child: Column(
                    children: [
                      Text("Laundry Loft",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w900),),
                      Text("Let It Bubble",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17),),
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(bottom:30),
                  child: Align(alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                          onTap: (){
                            callNext(context, Login());
                          },
                          child: button("Get Started",height/19,width/2.5,))),
                )



              ],
            ),
          ),
        ),



      ),
    );
  }
}
