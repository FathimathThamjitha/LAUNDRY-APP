


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laundry/provider/Mainprovider.dart';
import 'package:provider/provider.dart';
import '../Constant/myfunction.dart';
import 'wshingtype.dart';

import 'home.dart';

class Washing1 extends StatelessWidget {
  String wname;
  String lid;

   Washing1({super.key,required this.wname,required this.lid});

   // int valuenum =0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    LaundryProvider provider = Provider.of<LaundryProvider>(context,listen: false);

    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading:GestureDetector(
                onTap: (){
                  back(context);

                },
                child: BackButton(color: Colors.black,))
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text(wname,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 23),),



                SizedBox(height: 20,),

                Consumer<LaundryProvider>(
                  builder: (context,value,child) {
                    return Container(
                      child:  value.getLaundryCategoryLoader?Center(child: CircularProgressIndicator(color:Color(0xff6F2DA8),)):ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                        itemCount: value.categorylist.length,
                        itemBuilder: (context,index) {

                         // scrollDirection: Axis.vertical,

                          return Container(
                            // height: height,
                            // width: width,
                            child: Row(
                              children: [
                              Consumer<LaundryProvider>(
                                    builder: (context,value,child) {
                                      return InkWell(
                                        onTap: (){
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              backgroundColor: Color(0xffD9D9D9),

                                              content:Text("Are you sure want to edit or delete?",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  // fontFamily: 'Futura',
                                                  color:  Color(0xff35103B),
                                                ),),
                                              actions: [
                                                Row(
                                                  children: [
                                                    Consumer<LaundryProvider>(
                                                        builder: (context,value,child) {
                                                          return TextButton(
                                                              onPressed: () {
                                                                finish(context);
                                                                value.editCategoryType(value.categorylist[index].id );
                                                                print(value.categorylist[index].id+"kjjjj");
                                                                callNext(context, AddWashtype(from: 'EDIT',wId:'',laundryId: lid,));

                                                              },
                                                              child: Text("EDIT",
                                                                style: TextStyle(fontSize: 15,  fontFamily: 'Futura',color:Color(0xff35103B)
                                                                ),));
                                                        }
                                                    ),
                                                    Consumer<LaundryProvider>(
                                                        builder: (context,value,child) {
                                                          return TextButton(
                                                            onPressed: () {
                                                              provider.DeleteCategoryType(value.categorylist[index].id,context);
                                                              finish(context);

                                                            },

                                                            child: Text("DELETE",
                                                              style: TextStyle(fontSize: 15,  fontFamily: 'Futura',color:Color(0xffFF0000)
                                                              ),),
                                                          );
                                                        }
                                                    ),
                                                  ],
                                             ),
                                          ],



                                        ),
                                      );
                                   },
                                       child: Container(
                                         margin: EdgeInsets.all(15),
                                         height:70,

                                        child: Row(
                                          children: [
                                            Container(height:130,width: 65,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:BorderRadius.circular(10),border: Border.all(color: Colors.grey.shade200),

                                                  image: DecorationImage(image: NetworkImage(value.categorylist[index].photo),fit: BoxFit.fill,),
                                                  boxShadow: [BoxShadow(color: Colors.grey.shade400,blurRadius: 2,spreadRadius: 2),]


                                              ),
                                                // child: Image.network(value.WashList[index].photo,fit: BoxFit.cover),


                                            ),
                                            SizedBox(width: 10,),
                                            Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(value.categorylist[index].name,style: TextStyle(fontWeight: FontWeight.w500,fontSize:17),),
                                                Text(value.categorylist[index].price.toString(),style: TextStyle(color: Colors.blue.shade700,fontWeight: FontWeight.w400,fontSize:16),) ,

                                              ],
                                            )
                                          ],
                                        ),
                                        // child: Image.asset(,fit:BoxFit.cover,)) ,
                                   ),
                                );
                               }
                            ),

                             ],
                            ),
                           );


                         // return Padding(
                         //   padding:  EdgeInsets.only(top:26,left: 10),
                         //   child:ListTile(
                         //     leading:Consumer<LaundryProvider>(
                         //       builder: (context,value,child) {
                         //         return InkWell(
                         //           onTap: (){
                         //             showDialog(
                         //               context: context,
                         //               builder: (ctx) => AlertDialog(
                         //                 backgroundColor: Color(0xffD9D9D9),
                         //
                         //                 content:Text("Are you sure want to edit or delete?",
                         //                   style: TextStyle(
                         //                     fontSize: 15,
                         //                     // fontFamily: 'Futura',
                         //                     color:  Color(0xff35103B),
                         //                   ),),
                         //                 actions: [
                         //                   Row(
                         //                     children: [
                         //                       Consumer<LaundryProvider>(
                         //                           builder: (context,value,child) {
                         //                             return TextButton(
                         //                                 onPressed: () {
                         //                                   finish(context);
                         //                                   value.editWashType(value.WashList[index].id );
                         //                                   print(value.WashList[index].id+"kjjjj");
                         //                                   callNext(context, Washtype(from: 'EDIT',wId :value.WashList[index].id ,));
                         //
                         //                                 },
                         //                                 child: Text("EDIT",
                         //                                   style: TextStyle(fontSize: 15,  fontFamily: 'Futura',color:Color(0xff35103B)
                         //                                   ),));
                         //                           }
                         //                       ),
                         //                       Consumer<LaundryProvider>(
                         //                           builder: (context,value,child) {
                         //                             return TextButton(
                         //                               onPressed: () {
                         //                                 provider.DeleteWashType(value.WashList[index].id,context);
                         //                                 finish(context);
                         //
                         //                               },
                         //
                         //                               child: Text("DELETE",
                         //                                 style: TextStyle(fontSize: 15,  fontFamily: 'Futura',color:Color(0xffFF0000)
                         //                                 ),),
                         //                             );
                         //                           }
                         //                       ),
                         //                     ],
                         //                   ),
                         //                 ],
                         //
                         //
                         //
                         //               ),
                         //             );
                         //           },
                         //           child: Container(height:100,width: 50,
                         //               decoration: BoxDecoration(color: Colors.white,
                         //             borderRadius:BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(value.WashList[index].photo),fit: BoxFit.fill,),
                         //             boxShadow: [BoxShadow(color: Colors.grey.shade400,blurRadius: 2,spreadRadius: 2),]
                         //
                         //
                         //           ),
                         //               // child: Image.asset(,fit:BoxFit.cover,)) ,
                         //           ),
                         //         );
                         //       }
                         //     ),
                         //     title: Text(value.WashList[index].typename,style: TextStyle(fontWeight: FontWeight.w500,fontSize:17),),
                         //     subtitle:Text(value.WashList[index].typeprice.toString(),style: TextStyle(color: Colors.blue.shade700,fontWeight: FontWeight.w400,fontSize:16),) ,
                         //     // trailing:  SizedBox(
                         //     //   width:100,
                         //     //   child: Row(
                         //     //     children: [
                         //     //       InkWell(
                         //     //         onTap:(){
                         //     //           value.subtract(value.WashList[index].count,value.WashList[index].id);
                         //     //         },
                         //     //         child:  Container(
                         //     //           decoration: BoxDecoration(
                         //     //               borderRadius: BorderRadius.circular(21),boxShadow:[BoxShadow(color: Colors.grey.shade300,blurRadius: 2,spreadRadius: 2)],
                         //     //               color: Colors.white
                         //     //           ),
                         //     //           child: Icon(Icons.remove),
                         //     //         ),),
                         //     //
                         //     //   SizedBox(width: 5,),
                         //     //   Text(value.WashList[index].count.toString()),
                         //     //   SizedBox(width: 5,),
                         //     //
                         //     //
                         //     //   InkWell(
                         //     //       onTap: (){
                         //     //         value.add(value.WashList[index].count,value.WashList[index].id);
                         //     //       },
                         //     //       child:
                         //     //       Container(
                         //     //           decoration: BoxDecoration(
                         //     //               borderRadius: BorderRadius.circular(21),boxShadow:[BoxShadow(color: Colors.grey.shade300,blurRadius: 2,spreadRadius: 2)],
                         //     //               color: Colors.white
                         //     //           ),
                         //     //           child:Icon(Icons.add)
                         //     //       )
                         //     //   ),
                         //     //     ],
                         //     //   ),
                         //     // ),
                         //   )
                         //
                         // );


                        }
                      ),
                    );

                  }
                )
              ],
            ),
          ),
        ),
        floatingActionButton: Consumer<LaundryProvider>(
          builder: (context,value,child) {
            return FloatingActionButton(
                child: Icon(Icons.add,color: Colors.white,size:30,),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),backgroundColor: Color(0xff6F2DA8),
                onPressed: (){
                 value.clearcatfn();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddWashtype(from: "NEW",wId: '',laundryId: lid,)));
                });
          }
        ),

      ),

    );
  }
}