import 'package:flutter/material.dart';
import 'package:laundry/Constant/refactoring.dart';
import 'package:laundry/User/first.dart';
import 'package:laundry/User/washing.dart';
import 'package:laundry/provider/Mainprovider.dart';
import 'package:provider/provider.dart';

import '../Constant/myfunction.dart';
import 'about_us_user.dart';
import 'orderdtls.dart';
import 'orderstatus.dart';

class Home extends StatefulWidget {
  String userid;
  String name;
  String phone;
   Home({super.key,required this.userid,required this.phone,required this.name});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    print("sdijbcljdhb"+widget.userid);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(backgroundColor: Color(0xff6F2DA8),
      appBar: AppBar(
           leading:GestureDetector(
          onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>First(userid: widget.userid,phone: widget.phone,name: widget.name,)));
        },
        child: BackButton(color: Colors.white,)),
          backgroundColor: Color(0xff6F2DA8),
        title: Text("Welcome,",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 23,color: Colors.white),),
             actions: [
       PopupMenuButton<String>(color: Colors.white,
          onSelected: (value){
            print(value);
            callNext(context, Aboutus1());
          },


          itemBuilder:(BuildContext context ){

            return[
              PopupMenuItem(
                child: Text(" About us",style: TextStyle(color: Colors.black),),
                value:"  About us",
              ),

            ];
          })
          ]
      ),
      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
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

                    child: Consumer<LaundryProvider>(
                      builder: (context,valu,child) {
                        return TextFormField(
                          onChanged: (value) {
                         valu.searchProduct(value);
                        },
                          decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.purple)),
                          prefixIcon: Icon(Icons.search_rounded,color:Colors.black12,),

                            hintText: "Search",hintStyle: TextStyle(color: Colors.black12,fontSize:19),
                            enabledBorder:border,
                            focusedErrorBorder: border,
                            errorBorder: border,
                          ),


                        );
                      }
                    ),
                  ),
                ),
              ),
              SizedBox(height:10,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Order(userid: widget.userid,phone: widget.phone,name: widget.name,)));
                },
                child: Container(height: 50,
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_outlined,color: Colors.white,),
                      SizedBox(width: 5,),
                      Text("Deliver to Aishwarya-Perinthalm...679321",style: TextStyle(fontSize:15,color: Colors.white),)
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.3)),
                ),
              ),
              SizedBox(height:15,),

            Consumer<LaundryProvider>(
              builder: (context,value,child) {
                return GridView.builder(
                  shrinkWrap: true,
                    physics: ScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    itemCount: value.TypeList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 10,
                        crossAxisCount:2 ,
                        childAspectRatio:1.1),
                    itemBuilder: (BuildContext context, int index) {
                      var item= value.TypeList[index];
                      return GestureDetector(onTap: (){
                        var item= value.TypeList[index].id.toString();
                        value.getLaundryCategory(item);
                        value.total_price1=0.0;
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Washing(catid: value.TypeList[index].id.toString(),catname:value.TypeList[index].type.toString(),
                        userid:widget.userid,phone: widget.phone,name: widget.name,
                        )));
                      },
                        child: Container(
                            height: 300,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(blurRadius:3,color: Colors.grey.shade400)],color: Colors.white
                          ),
                          child: Column(children: [
                            Container(height:120,width: 130,
                                child: Image.network(item.photo,fit: BoxFit.cover,)),
                            Text(item.type,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),)
                          ],)
                        ),
                      );
                    });
              }
            ),
              SizedBox(height: 50,),
              Consumer<LaundryProvider>(
                builder: (context,value,child) {
                  return GestureDetector(
                    onTap: (){
                      print(widget.userid+"sfnkjgl");
                      value.getstatus(widget.userid,);
                      Future.delayed(Duration(milliseconds: 2000), () {
                        callNext(context, Orderst(userid: widget.userid,phone: widget.phone,name: widget.name,ticks:value.tick,));

                      });


                      print("ticks"+value.tick.toString());

                    },
                    child: Container(
                      color:Colors.white ,height: 60,width: width,
                      child: Row(
                        children: [
                          SizedBox(width: 50,),
                          Text("Order Status",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.black),),
                          SizedBox(width: 30,),
                          Image.asset("assets/img_11.png")
                        ],
                      ),
                    ),
                  );
                }
              ),
              SizedBox(height: 30,)


    ]
    ),

        ),
      ),


    );
  }
}
