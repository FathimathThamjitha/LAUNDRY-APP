import 'package:flutter/material.dart';
import 'package:laundry/Constant/refactoring.dart';

import 'home.dart';

class Order extends StatelessWidget {
  String userid;
  String name;
  String phone;
  Order({super.key,required this.userid,required this.phone,required this.name});

  @override
  Widget build(BuildContext context ) {

    return Scaffold(
      appBar: AppBar(
        leading:GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Home(userid: userid,name: name,phone: phone,)));
            },
            child: BackButton(color: Colors.black,)),
      ),
     body: SingleChildScrollView(
       child: Column(
         children: [
           Center(
             child: Padding(
               padding: const EdgeInsets.only(top: 10),
               child: Container(height: 310,width: 320,

             child:Column(
               children: [
                SizedBox(height: 10,),
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               orderlist("Items", "Shirt", "T-shirt", "Pants/Jeans", "Jacket",),
                SizedBox(width: 20,),
                orderlist("Quantity", "03", "02", "01", "01",),
                SizedBox(width:60,),
                orderlist("Price",  "₹60", "₹20", "₹10", "₹19",),
                SizedBox(width: 10,)
              ],
            ),
          ),

          SizedBox(height: 40,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Delivery Charge",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
              SizedBox(width: 50,),
              Text("₹30",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18))
            ],
          ),
          SizedBox(height: 20,),
          Divider(color: Colors.black26,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Total",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
              SizedBox(width: 110,),
              Text("₹149",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)
            ],
          ),
        ],
    ),
    decoration: BoxDecoration(
    boxShadow: [BoxShadow(color: Colors.grey.shade300,blurRadius: 2,spreadRadius: 2)],color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    ),
               ),

             ),

           ),
           SizedBox(height: 30,),

           Container(
             height: 230,width: 330,
             child: Padding(
               padding: const EdgeInsets.only(left: 10),
               child: Column
                 (mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [

                   Row(
                     children: [

                       Text("Name:",style: TextStyle(fontWeight: FontWeight.w400,fontSize:19,),),
                       SizedBox(width: 20,),
                       Text("Aishwarya",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16),),
                     ],
                   ),
                   SizedBox(height: 5,),
                   Row(
                     children: [

                       Text("Phone:",style: TextStyle(fontWeight: FontWeight.w400,fontSize:19,),),
                       SizedBox(width: 20,),
                       Text("9736352670",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16,),),
                     ],
                   ),
                   SizedBox(height: 5,),
                   Row(
                     children: [
                       Text("Pickup Address:",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19),),
                       SizedBox(width: 20,),
                       Text("pallakkal(h)\n"
                           "Angadippuram(po)\n"
                           "Malappuram",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16,),),
                     ],
                   ), Row(
                     children: [
                       Text("Pickup Time:",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19),),
                       SizedBox(width: 20,),
                       Text("1.00pm",style:TextStyle(fontWeight: FontWeight.w300,fontSize: 16,),),
                     ],
                   ),


                 ],
               ),
             ),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey.shade300,blurRadius: 2,spreadRadius: 2)],color: Colors.white,
          borderRadius: BorderRadius.circular(8),
    ),
           ),
           SizedBox(height: 100,),
         ],
    ),
     )

    );
  }
}
