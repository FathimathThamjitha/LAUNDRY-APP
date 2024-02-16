import 'package:flutter/material.dart';
import 'package:laundry/Constant/myfunction.dart';
import 'package:laundry/provider/Mainprovider.dart';
import 'package:provider/provider.dart';

import '../Constant/refactoring.dart';
import 'bookings.dart';

class Bookingdtls extends StatefulWidget {
  String  id;
  String name;
  String phone;
  String orderstatus;
  String orderdate;
  String deliverydate;
  String ordertime;
  String paymentmethod;
  String status;
  Bookingdtls({
    super.key,
    required this.id,
    required this.name,
    required this.phone,
    required this.orderstatus,
    required this.orderdate,
    required this.deliverydate,
    required this.ordertime,
    required this.paymentmethod,
    required this.status,
  });

  @override
  State<Bookingdtls> createState() => _BookingdtlsState();
}

class _BookingdtlsState extends State<Bookingdtls> {
  final orderlist = ["Shirt-3","T-shirt-2","Pants/Jeans-1","Jacket-1"];

  @override
  Widget build(BuildContext context) {
    String dropdownValue ='Washing';
    String dropdownValue1 ='Sept 17';
    String dropdownValue2 ='Credit Card';
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading:GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Booking()));
              },
              child: BackButton(color: Colors.black,)),
          title: Text("Order Details",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 23,color: Colors.black),),

        ),
        body: Column(
          children: [
          SizedBox(height: 30,),
        Center(
        child: Container(
        height: 380,width: 350,decoration:BoxDecoration(
        color: Color(0xff6F2DA8),borderRadius: BorderRadius.circular(12)
    ),
        child: Padding(
        padding: const EdgeInsets.only(left: 27),
    child: Column(mainAxisAlignment: MainAxisAlignment.center,
    children: [
    SizedBox(height: 10,),
    Row(
    children: [

    Text("Name:",style: TextStyle(fontWeight: FontWeight.w600,fontSize:21,color: Colors.white),),
    SizedBox(width: 20,),
    Text(widget.name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
    ],
    ),
    SizedBox(height: 5,),
    Row(
    children: [

    Text("Phone:",style: TextStyle(fontWeight: FontWeight.w600,fontSize:20,color: Colors.white),),
    SizedBox(width: 20,),
    Text(widget.phone,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Colors.white),),
    ],
    ),
    SizedBox(height: 5,),

    Row(
    children: [
    Text("Order Status:",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500,color: Colors.white),),
    SizedBox(width: 10,),
    Container(height:30,
    decoration:BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    boxShadow: [BoxShadow(color: Colors.grey.shade700,blurRadius: 2,spreadRadius: 2)],color: Colors.white,
    ),
    child: DropdownButton<String>(value:dropdownValue,
    items: <String>['Washing','Ironing','Dry Cleaning','Conditioning','Powder Wash','Hand Wash'].map<DropdownMenuItem<String>>
    ((String value){
    return DropdownMenuItem<String>(value: value,
    child: Center(
    child: Text(
    value,style: TextStyle(fontSize: 16,color: Colors.grey.shade900),
    ),
    ),
    );
    }).toList(),
    onChanged: (String? newValue) {
      setState(() {
        dropdownValue = newValue!;
      }
      );
    }
    ),
    )
    ],
    ),
     SizedBox(height: 5,),
     bulletslist("Shirt-3"),
      bulletslist("T-shirt-2"),
      bulletslist("Pant/Jeans-1"),
      bulletslist("Jacket-1"),
      SizedBox(height: 10,),
      Row(
        children: [

          Text("Order Date:",style: TextStyle(fontWeight: FontWeight.w600,fontSize:20,color: Colors.white),),
          SizedBox(width: 20,),
          Text(widget.deliverydate,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Colors.white),),
        ],
      ),
      SizedBox(height: 5,),
      Row(children: [
        Text("Delivry Date:",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500,color: Colors.white),),
        SizedBox(width: 10,),
        Container(height:28,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.grey.shade700,blurRadius: 2,spreadRadius: 2)],color: Colors.white,
          ),
          child: DropdownButton<String>(value:dropdownValue1,
              items: <String>['Sept 17','Sept 18','Sept 19','Sept 20','Sept 21','Sept 22'].map<DropdownMenuItem<String>>
                ((String value){
                return DropdownMenuItem<String>(value: value,
                  child: Center(
                    child: Text(
                      value,style: TextStyle(fontSize: 16,color: Colors.grey.shade900),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                }
                );
              }
          ),
        )
      ],),
      SizedBox(height: 5,),
      Row(
        children: [

          Text("Order Time:",style: TextStyle(fontWeight: FontWeight.w600,fontSize:20,color: Colors.white),),
          SizedBox(width: 20,),
          Text(widget.ordertime,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Colors.white),),
        ],
      ),
      // SizedBox(height: 10,),
      // Row(
      //   children: [
      //     Text("Payment:",style: TextStyle(fontWeight: FontWeight.w600,fontSize:20,color: Colors.white),),
      //      SizedBox(width: 20,),
      //     Text("Yes",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Colors.white),),
      //     SizedBox(width: 10,),
      //     // Text("No",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Colors.white),),
      //
      //   ],
      // ),
      SizedBox(height: 10,),
      Row(
        children: [
          Text("Payment Method:",style: TextStyle(fontWeight: FontWeight.w600,fontSize:20,color: Colors.white),),
          SizedBox(width: 10,),
          Container(height:30,
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.grey.shade700,blurRadius: 2,spreadRadius: 2)],color: Colors.white,
            ),
            child: DropdownButton<String>(value:dropdownValue2,
                items: <String>['Credit Card','Google Pay ','Phone Pae','Cash On Delivery'].map<DropdownMenuItem<String>>
                  ((String value){
                  return DropdownMenuItem<String>(value: value,
                    child: Center(
                      child: Text(
                        value,style: TextStyle(fontSize: 16,color: Colors.grey.shade900),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {

                    dropdownValue = newValue!;

                  }

                  );
                },

            ),
          )
        ],
      )

    ]
    )
    )
    )
    ),
            SizedBox(height: 50,),

            Padding(
              padding: const EdgeInsets.only(left:20),
              child: Consumer<LaundryProvider>(
                builder: (context,value,child) {

                  return widget.status=="REQUESTED"?Row(
                    children: [
                      InkWell(onTap: () {
                        value.acceptStatusUpdate(widget.id);
                        value.getPickupdtls();
                        back(context);
                      },
                          child: button("Accept", height/19,width/2.7)),

                      SizedBox(width: 50,),
                      InkWell(
                          onTap: () {
                            value.rejectStatusUpdate(widget.id);
                            value.getPickupdtls();
                            back(context);
                          },

                          child: button("Reject", height/20,width/2.7)),
                    ],
                  ):SizedBox();
                }
              ),
            )
    ]
    )
    );
  }
}
