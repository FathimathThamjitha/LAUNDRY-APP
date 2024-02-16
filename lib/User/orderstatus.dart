import 'package:flutter/material.dart';

import 'home.dart';

class Orderst extends StatelessWidget {

  String userid;
  String name;
  String phone;
   int ticks;
  Orderst({super.key,required this.userid,required this.phone,required this.name, required this.ticks});




  @override
  Widget build(BuildContext context) {
     print("statustick"+ticks.toString());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              tick1(),
              spacer(),
              line(),
              spacer(),
              tick2(),
              spacer(),
              line(),
              spacer(),
              tick3(),
              spacer(),
              line(),
              spacer(),
              tick4(),
            ],
          ),
          progress()
        ],
      ),

    );
  }

               Widget tick(bool isChecked){
                 return isChecked?Icon(Icons.check_circle,color: Colors.blue,size:30,):Icon(Icons.radio_button_unchecked, color: Colors.blue,);
                 }
                 Widget tick1() {
                 return this.ticks>0?tick(true):tick(false);
                 }
                 Widget tick2() {
                 return this.ticks>1?tick(true):tick(false);
                 }
                 Widget tick3() {
                 return this.ticks>2?tick(true):tick(false);
                 }
                 Widget tick4() {
                 return this.ticks>3?tick(true):tick(false);
                 }

                 Widget spacer() {
                 return Container(
                 width: 3.0,
                 );
                 }

                 Widget line() {
                 return Container(

                 color: Colors.blue,
                 height: 3.0,
                   width: 50.0,
                 );
                }
                
                Widget progress(){
    return ticks==1?Column(
       children: [
         Image.asset("assets/img_28.png",scale: 2.5,),
         Text("Your Order Is Collected",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
         
       ],
     ):ticks==2?Column(
      children: [
        Image.asset("assets/img_29.png",scale: 2.5,),
        Text("In Progress...",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)


      ],
    ):ticks==3?Column(
      children: [
        Image.asset("assets/img_28.png",scale: 2.5,),
         Text("You Order Is On The Way",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)

      ],
    ):Column(
      children: [
        Image.asset("assets/img_30.png",scale: 2.5,),
        Text("Your Order Is Delivered",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)


      ],
    );
    
                    }


               
                
              }
              
              


