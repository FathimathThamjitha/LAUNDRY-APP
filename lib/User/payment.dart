import 'package:flutter/material.dart';
import 'package:laundry/User/pickupdtls.dart';
import 'package:laundry/User/success.dart';
import 'package:laundry/provider/Mainprovider.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  String userid;
  String name;
  String phone;
   Payment({super.key,required this.name,required this.phone,required this.userid});
  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String? type;
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var value;
    return Scaffold(
      appBar: AppBar(
        leading:GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Pickup(userid:widget.userid,name:widget.name,phone:widget.phone,)));
            },
            child: BackButton(color: Colors.black,)),
        title:  Text("Payment",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22),),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                ListTile(
                  title: Text("Credit/Debit Card",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                  leading: Radio(value: "Credit/Debit Card", groupValue: type, onChanged: (value){
                    setState(() {
                      type=value;
                    });
                  }),
                ),
                ListTile(
                  title: Text("Cash On Delivery",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                  leading: Radio(value: "Cash On Delivery", groupValue: type, onChanged: (value){
                    setState(() {
                      type=value;
                    });
                  }),
                ),
                ListTile(
                  title: Text("Google Pay",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                  leading: Radio(value: "Google Pay", groupValue: type, onChanged: (value){
                    setState(() {
                      type=value;
                    });
                  }),
                ),
                SizedBox(height: 60,),
                Container(height: 240,width: 325,
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Service Cost",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                          SizedBox(width:120,),
                          Consumer<LaundryProvider>(
                              builder: (context3,val, child) {
                              return Text(val.grand_total.toString(),style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w400),);
                            }
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Delivery Cost",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                          SizedBox(width: 120,),
                          Consumer<LaundryProvider>(
                              builder: (context2,val, child) {
                              return Text(val.delivery_charge.toString(),style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w400),);
                            }
                          )
                        ],
                      ),
                      SizedBox(height: 45,),
                      Divider(
                        color: Colors.black26,
                      ),
                      SizedBox(height:20,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Total",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                          SizedBox(width: 180,),
                          Consumer<LaundryProvider>(
                            builder: (context1,val, child) {
                              return Text((val.delivery_charge+val.grand_total).toString(),style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w400),);
                            }
                          )
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey.shade300,blurRadius: 2,spreadRadius: 2)],color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                ),
                SizedBox(height: 50,),
                GestureDetector(onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Success(name: widget.name,userid: widget.userid,phone: widget.phone,)));
                },
                  child: Container( height: height/17,
                    width: width/2.1,
                    decoration: BoxDecoration(
                        color: Color(0xff6F2DA8),
                        border:
                        Border.all(color: Colors.white.withOpacity(0)),borderRadius: BorderRadius.circular(15)),

                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Book Now",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600,fontSize:17),
                        ),
                        SizedBox(width:45,),
                    Icon(Icons.arrow_forward_outlined,color: Colors.white,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
