import 'package:flutter/material.dart';
import 'package:laundry/Constant/myfunction.dart';
import 'package:laundry/User/payment.dart';
import 'package:laundry/Constant/refactoring.dart';
import 'package:laundry/User/washing.dart';
import 'package:laundry/provider/Mainprovider.dart';
import 'package:provider/provider.dart';

class Pickup extends StatefulWidget {
  String userid;
  String name;
  String phone;
   Pickup({super.key,required this.userid,required this.phone,required this.name});

  @override
  State<Pickup> createState() => _PickupState();
}

class _PickupState extends State<Pickup> {
  @override
  Widget build(BuildContext context) {
    // DateTime date = DateTime(2023,12,14);
    // TimeOfDay time= TimeOfDay(hour: 10, minute: 30);
    // final hours=time.hour.toString().padLeft(2,'0');
    // final minutes=time.minute.toString().padLeft(2,'0');
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String dropdownValue ='Oct 2023';
    print("fjhvbjekfevbefv"+widget.userid);
    LaundryProvider provider=Provider.of<LaundryProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
          leading:GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Washing(catname:"",catid: '',name: widget.name,userid: widget.userid,phone: widget.phone,)));
              },
              child: BackButton(color: Colors.black,)),
        title:  Text("Pickup Details",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22),),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: 20,),
              Center(
                child: Consumer<LaundryProvider>(
                  builder: (context,value,child) {
                    return Container(width: 320,
                      child: TextFormField(
                        controller: value.Addresscontroller,
                        decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.purple),),
                          hintText: "Address\n"
                              "...............................................",hintStyle: TextStyle(color: Colors.black12,fontSize:20,fontWeight: FontWeight.w400),
                          suffixIcon: Icon(Icons.create_outlined,color:Colors.black12,),
                          enabledBorder:border,
                          focusedErrorBorder: border,
                          errorBorder: border,
                        ),

                        maxLines: 6,
                        minLines: 4,


                      ),
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                          color: Colors.grey.shade400,spreadRadius:1,blurRadius:2,
                        )],color: Colors.white,borderRadius: BorderRadius.circular(15)
                      ),
                    );
                  }
                ),
              ),
              SizedBox(height: 20,),
              Container( width: 330,height:180,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Colors.grey.shade400,spreadRadius:1,blurRadius:2,
                  )],color: Colors.white,borderRadius: BorderRadius.circular(15)
              ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 180),
                          child: Text("Pickup Date",style: TextStyle(fontWeight: FontWeight.w500,fontSize:21, ),),
                        ),
                        SizedBox(width:67,),
                    //     Container(height:30,
                    //       decoration:BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20),
                    //       boxShadow: [BoxShadow(color: Colors.grey.shade300,blurRadius: 2,spreadRadius: 2)],color: Colors.grey.shade100
                    //     ),
                    //       child: DropdownButton<String>(value:dropdownValue,
                    //           items: <String>['Oct 2023','Nov 2023','Dec 2023'].map<DropdownMenuItem<String>>
                    //             ((String value){
                    //              return DropdownMenuItem<String>(value: value,
                    //                  child: Text(
                    //                    value,style: TextStyle(fontSize: 13,color: Colors.grey.shade900),
                    //                  ),
                    //              );
                    //           }).toList(),
                    //           onChanged: (String? newValue){
                    //         setState((){
                    //           dropdownValue = newValue!;
                    //         });
                    //           }
                    //           ),
                    //     )
                    //   ],
                    // ),
                     SizedBox(height: 30,),
                    Consumer<LaundryProvider>(
                      builder: (context,val,child) {
                        return Container(
                          child: Column(
                            children: [
                              Text(val.dateController.text),
                              ElevatedButton(
                                  child: Text("Select Date"),
                                  onPressed: () async{
                                    val.selectDate(context);
                                 //  DateTime? newDate = await showDatePicker(context: context, initialDate: date, firstDate: DateTime(2023), lastDate: DateTime(2100));
                                 // //if 'cancel' =>null
                                 //  if(newDate==null)return;
                                 //  // if 'ok' =>DateTime
                                 //    setState(() =>  date = newDate   );
                              } ),
                            ],
                          ),

                        );
                      }
                    )

                    // SingleChildScrollView(scrollDirection: Axis.horizontal,padding: EdgeInsets.all(10),
                    //   child: Row(
                    //     children: [
                    //       SizedBox(width: 10,),
                    //       pickupdate(Colors.white, "Mon", "15",Colors.black),
                    //       SizedBox(width: 30,),
                    //       pickupdate(Color(0xff6F2DA8), "Tue", "16",Colors.white),
                    //       SizedBox(width: 30,),
                    //       pickupdate(Colors.white, "Wed", "17",Colors.black),
                    //       SizedBox(width: 30,),
                    //       pickupdate(Colors.white, "Thu", "18",Colors.black),
                    //       SizedBox(width: 30,),
                    //       pickupdate(Colors.white, "Fri", "19",Colors.black),
                    //       SizedBox(width: 30,),
                    //       pickupdate(Colors.white, "Sat", "20",Colors.black),
                    //       SizedBox(width: 30,),
                    //
                    //     ],
                    //   ),
                    // ),

                  ],
                ),
              ),
      SizedBox(height: 20,),
      Consumer<LaundryProvider>(
        builder: (context,value,child) {
          return Container( width: 330,height:180,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Colors.grey.shade400,spreadRadius:1,blurRadius:2,
                )],color: Colors.white,borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              children: [
              SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(right:180),
                  child: Text("Pickup Time",style: TextStyle(fontWeight: FontWeight.w500,fontSize:21 ),),
                ),
                SizedBox(height: 10,),

                Text(value.timeController.text),
                ElevatedButton(
                    child: Text('Select Time'),
                  onPressed:() async{
                      value.selectTime(context);
                    // TimeOfDay? newTime =await showTim ePicker(context: context, initialTime: time);
                    // if(newTime==null)return;
                    // setState(() =>time=newTime);
                }
                )
            // SingleChildScrollView(scrollDirection: Axis.horizontal,padding: EdgeInsets.all(10),
            //   child: Row(
            //     children: [
            //       SizedBox(width: 5,),
            //       pickuptime("12.00pm", Colors.white,  Colors.black),
            //       SizedBox(width: 15,),
            //       pickuptime("1.00pm", Color(0xff6F2DA8),  Colors.white),
            //       SizedBox(width: 15,),
            //       pickuptime("2.00pm", Colors.white,  Colors.black),
            //       SizedBox(width: 15,),
            //       pickuptime("3.00pm", Colors.white,  Colors.black),
            //       SizedBox(width: 15,),
            //       pickuptime("4.00pm", Colors.white,  Colors.black),
            //       SizedBox(width: 15,),
            //       pickuptime("5.00pm", Colors.white,  Colors.black),
            //       SizedBox(width: 15,),
            //       pickuptime("6.00pm", Colors.white,  Colors.black),
            //       SizedBox(width: 15,),
            //     ],
            //   ),
            // ),
            ]
          ),
    );
        }
      ),
              SizedBox(height: 20,),
              Container( width: 330,height:180,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Colors.grey.shade400,spreadRadius:1,blurRadius:2,
                    )],color: Colors.white,borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),

                    Padding(
                      padding: const EdgeInsets.only(right: 170),
                      child: Text("Delivery Date",style: TextStyle(fontWeight: FontWeight.w500,fontSize:21 ),),
                    ),

                    SizedBox(height: 30,),

                    SingleChildScrollView(scrollDirection: Axis.horizontal,padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          pickupdate(Colors.white, "Mon", "15",Colors.black),
                          SizedBox(width: 30,),
                          pickupdate(Colors.white, "Tue", "16",Colors.black),
                          SizedBox(width: 30,),
                          pickupdate(Color(0xff6F2DA8), "Wed", "17",Colors.white),
                          SizedBox(width: 30,),
                          pickupdate(Colors.white, "Thu", "18",Colors.black),
                          SizedBox(width: 30,),
                          pickupdate(Colors.white, "Fri", "19",Colors.black),
                          SizedBox(width: 30,),
                          pickupdate(Colors.white, "Sat", "20",Colors.black),
                          SizedBox(width: 30,),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 50,)
    ]
    )
    ),
     bottomSheet: Container(height:55,decoration: BoxDecoration(
       boxShadow: [BoxShadow(color: Colors.grey.shade400,blurRadius:1,spreadRadius:1)],color:Colors.white,
     ),
       child: Consumer<LaundryProvider>(
         builder: (context,value,child) {
           return GestureDetector(
             onTap: (){
               value.addPickupdtls(widget.userid,widget.name,widget.phone,
                   // userid,value.name,value.phone
               );
               value.find_grand_total();
               callNext(context,  Payment(name:widget.name,phone: widget.phone,userid: widget.userid));
             },
               child: button("Go For Payment", height/17, width/2, ));
         }
       ),
     ),
    );
  }
}
