
import 'package:flutter/material.dart';
import 'package:laundry/Constant/refactoring.dart';
import 'package:laundry/User/pickupdtls.dart';
import 'package:laundry/provider/Mainprovider.dart';
import 'package:provider/provider.dart';

import '../Constant/myfunction.dart';
import 'home.dart';

class Washing extends StatelessWidget {
  String catname;
  String catid;
  String userid;
  String name;
  String phone;
   Washing({super.key,required this .catname,required this.catid,required this.userid,required this.phone,required this.name});



  @override
  Widget build(BuildContext context) {
    print("kvbfjvhfvff"+userid);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading:GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Home(userid: userid,phone: phone,name: name,)));
                },
                child: BackButton(color: Colors.black,))
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 215),
                child: Text(catname,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 23),),
              ),
              SizedBox(height: 20,),
              Center(
                child: SizedBox( width:300,height:42,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [BoxShadow(color: Colors.grey.shade400,blurRadius: 3)]
                    ),

                    child: TextFormField(
                      decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.purple)),
                        prefixIcon: Icon(Icons.search_rounded,color:Colors.black12,),
                        hintText: "Search",hintStyle: TextStyle(color: Colors.black12,fontSize:19),
                        enabledBorder:border,
                        focusedErrorBorder: border,
                        errorBorder: border,
                      ),

                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Consumer<LaundryProvider>(
                builder: (context,value,child) {
                  return Container(
                    child: ListView.builder(physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:value.categorylist.length,

                        itemBuilder: (context,index) {
                      var item=value.categorylist[index];

                       double basic_price = value.default_laundrylist[index].price;
                       //print("${value.default_laundrylist[index].name} price = ${value.default_laundrylist[index].price}");

                          // scrollDirection: Axis.vertical,

                          return Padding(
                              padding:  EdgeInsets.only(top:26,left: 10),

                              child:ListTile(
                                leading:Container(height:55,width: 50,
                                  decoration: BoxDecoration(color: Colors.white,
                                      borderRadius:BorderRadius.circular(10),image: DecorationImage(image:NetworkImage(item.photo)),
                                      boxShadow: [BoxShadow(color: Colors.grey.shade400,blurRadius: 2,spreadRadius: 2),]


                                  ),
                                  // child: Image.asset(,fit:BoxFit.cover,)) ,
                                ),
                                title: Text(item.name,style: TextStyle(fontWeight: FontWeight.w500,fontSize:17),),
                                subtitle:Text(item.price.toString(),style: TextStyle(color: Colors.blue.shade700,fontWeight: FontWeight.w400,fontSize:16),) ,
                          trailing:

                          SizedBox(width: 72,
                            child: Row(
                              children: [
                                Container(

                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21),boxShadow:[BoxShadow(color: Colors.grey.shade300,blurRadius: 2,spreadRadius: 2)],
                                      color: Colors.white
                                  ),
                                  child: Consumer<LaundryProvider>(
                                    builder: (context,value,child) {
                                      return InkWell(
                                           onTap: (){
                                             value.decrement(item.count,item.id,item.price,basic_price);
                                           },
                                          child: Icon(Icons.remove));
                                    }
                                  ),
                                ),

                            SizedBox(width: 5,),
                            Text(item.count.toString()),
                                SizedBox(width: 5,),



                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(21),boxShadow:[BoxShadow(color: Colors.grey.shade300,blurRadius: 2,spreadRadius: 2)],
                                    color: Colors.white
                                ),
                                child:Consumer<LaundryProvider>(
                                  builder: (context,value,child) {
                                    return InkWell(
                                      onTap: (){
                                        item.count++;
                                        print("xyz"+item.count.toString());
                                       value.Inrement(item.count,item.id,basic_price);
                                      },
                                        child: Icon(Icons.add));
                                  }
                                )
                            ),
                              ],
                            ),
                          )

                                  )
                          );





                        }
                    ),


                  );
                }
              ),
              SizedBox(height: 70,),

            ],
          ),
        ),
        bottomSheet: Container(height:55,decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey.shade400,blurRadius:1,spreadRadius:1)],color:Colors.white,
        ),
          child: Row(
            children: [

              GestureDetector(
              onTap: (){
            callNext(context,Home(userid:userid,phone: phone,name: name,));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10,left: 10),
              child: button("Add More", height/17, width/3, ),

            )),

              Consumer<LaundryProvider>(
                  builder: (context8, value, child) {
                  return GestureDetector(
                      onTap: (){
                        value.total_list.add(value.total_price1);
                        callNext(context,Pickup(userid:userid,phone: phone,name: name,));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10,left: 20),
                        child: button("Finish", height/17, width/3, ),

                      ));
                }
              ),
              SizedBox(width: width/25,),
              Consumer<LaundryProvider>(
                builder: (context1, value, child) {
                  return Text(value.total_price1.toString(),style: TextStyle(color: Colors.blueAccent,fontSize: 25,fontWeight: FontWeight.w500),);
                }
              ),


            ],
          ),
          
        ),
      ),

    );
  }
}
