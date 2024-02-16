
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laundry/Admin/washing.dart';
import 'package:laundry/provider/Mainprovider.dart';
import 'package:provider/provider.dart';

import '../Constant/myfunction.dart';
import '../Constant/refactoring.dart';
import 'About_us.dart';
import 'laundrytype.dart';
import 'mainpage.dart';


class Home1 extends StatefulWidget {
  Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {

  int indexNum=0;


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    LaundryProvider provider = Provider.of<LaundryProvider>(context,listen: false);
    return  Scaffold(
      appBar: AppBar(
          leading:GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Mainpg1()));
              },
              child: BackButton(color: Colors.black,)),
              title: Text("Launder Type",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 23),),
          actions: [
      Consumer<LaundryProvider>(
        builder: (context,value1,child) {
          return PopupMenuButton<String>(color: Colors.black,
              onSelected: (value){
                print(value);
                callNext(context, Aboutus());
              },


              itemBuilder:(BuildContext context ){

                return[
                  PopupMenuItem(
                    child: Text("Add About us",style: TextStyle(color: Colors.white),),
                    value:" Add About us",
                  ),

                ];
              });
        }
      ),
      ]
      ),

      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Center(
                  child: SizedBox( width:300,height:45,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [BoxShadow(color: Colors.grey.shade500,blurRadius: 3)]
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
                SizedBox(height: 20,),
                Container(
                  child: Consumer<LaundryProvider>(
                    builder: (context,value,child) {
                      return  value.gettypeLoader?Center(child: CircularProgressIndicator(color:Color(0xff6F2DA8),)): GridView.builder(shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          physics: ScrollPhysics(),
                          itemCount: value.TypeList.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              crossAxisCount:2 ,
                              childAspectRatio:0.8),
                          itemBuilder: (BuildContext context, int index) {
                        return
                          InkWell(
                          onLongPress: (){
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
                                            return InkWell(
                                                onLongPress: () {

                                                  finish(context);
                                                  value.editType(value.TypeList[index].id );
                                                  print(value.TypeList[index].id+"kjjjj");
                                                  callNext(context, Addmenu(from: 'EDIT',tId :value.TypeList[index].id ,));

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
                                              provider.DeleteType(value.TypeList[index].id,context);
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
                            onTap:() {
                              print(value.TypeList[index].id+"l,kkk");
                              print(value.TypeList[index].type+"mkmjmjj");
                             var item= value.TypeList[index].id.toString();
                              value.getLaundryCategory(item);

                              callNext(context, Washing1(wname:value.TypeList[index].type.toString(),lid: value.TypeList[index].id.toString(),));

                            },
                           child: Card(
                             child: Container(
                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                 image: DecorationImage(image: NetworkImage(value.TypeList[index].photo,),fit: BoxFit.fill),
                                 boxShadow: [BoxShadow(blurRadius: 3,offset: Offset(0, 3),color: Colors.grey.shade500)]
                               ),
                               child: Container(decoration: BoxDecoration(color: Colors.white,borderRadius:BorderRadius.circular(10) ),
                                 margin:EdgeInsets.only(top: height/5),
                                 child: Center(child: Text(value.TypeList[index].type,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17),)),
                               ),
                             ),
                           ),
                        );

                          });
                    }
                  ),
                ),
                SizedBox(height: 30,)



              ]
          ),
        ),
      ),
     floatingActionButton: Consumer<LaundryProvider>(
       builder: (context,value,child) {
         return FloatingActionButton(
             child: Icon(Icons.add,color: Colors.white,size:30,),
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),backgroundColor: Color(0xff6F2DA8),
             onPressed: (){
            value.clearfn();
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Addmenu(from: "NEW",tId: '',)));
             });
       }
     ),
 
    );
  }
}