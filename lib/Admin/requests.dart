import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Mainprovider.dart';
import 'mainpage.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading:GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Mainpg1()));
            },
            child: BackButton(color: Colors.black,)),
        title: Text("Requests",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 23),),

      ),
      body: SizedBox(
        height: height,
        child: Consumer<LaundryProvider>(
            builder: (context,value,child) {
              return value.CustList.isNotEmpty?
              value.getcustdtlsLoader?Center(child: CircularProgressIndicator(color:Color(0xff6F2DA8),)): ListView.builder(
                itemCount: value.CustList.length,
                itemBuilder: (context, index) {
                  var items=value.CustList[index];

                  return Column(
                    children: [
                      Container(margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        height:150,
                        width: width,
                        decoration: BoxDecoration(color: Color(0xff6F2DA8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [


                                Padding(
                                  padding:  EdgeInsets.only(left: 14,top: 8),
                                  child: Text("Name:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
                                ),
                                SizedBox(width: 10,),
                                Padding(
                                  padding:  EdgeInsets.only(top: 8),
                                  child: Text(items.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: 14,top: 7),
                                  child: Text("Phone No:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
                                ),
                                SizedBox(width: 10,),
                                Padding(
                                  padding:  EdgeInsets.only(top: 8),
                                  child: Text(items.phone,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Padding(
                              padding:  EdgeInsets.only(left:90),
                              child: Row(
                                children: [
                                 Consumer<LaundryProvider>(
                                    builder: (context,value,child) {
                                      return InkWell(
                                        onTap: (){
                                          value.acceptRequest(items.id,items.name,items.phone,context);

                                        },
                                        child: Container(
                                          height: height/18,
                                          width: width/3.80,
                                          decoration: BoxDecoration(color: Colors.white,
                                              borderRadius: BorderRadius.circular(4)),
                                          child: Center(child: Text("Accept",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),)),
                                        ),
                                      );
                                    }
                                  ),
                                  SizedBox(width: 10,),
                                  Consumer<LaundryProvider>(
                                    builder: (context,value,child) {
                                      return InkWell(
                                        onTap: (){
                                          value.declineRequest(items.id,context);

                                        },
                                        child: Container(
                                          height: height/18,
                                          width: width/3.80,
                                          decoration: BoxDecoration(color:  Colors.white,
                                              borderRadius: BorderRadius.circular(4)),
                                          child: Center(child: Text("Decline",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),)),
                                        ),
                                      );
                                    }
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
                ):
              Center(child: Text("Empty......"),);
            }
        ),
      ),
    );
  }
}
