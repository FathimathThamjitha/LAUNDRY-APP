import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget button(String name,dynamic height,dynamic width,){

  return Center(
    child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Color(0xff6F2DA8),
              border:
              Border.all(color: Colors.white.withOpacity(0))),
          child: Center(
              child: Text(
                name,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600,fontSize:17),
              )),
        )),
  );
}
    InputBorder border=OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),
    borderSide: BorderSide(color: Colors.grey,width: 0.2,));


Widget otpbox(double height, double width,){
  return Padding(
    padding: const EdgeInsets.only(left:25),
    child: Container(height: height,width: width,
      decoration: BoxDecoration(color: Color(0xff6F2DA8),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        decoration: InputDecoration(

            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
            )
        ),
        style: TextStyle(color: Colors.white,fontSize:25),
      ),

    ),
  );
} 
  Widget washbox ( image,String type,String price,String num,) {
    return
      Row(
        children: [
          SizedBox(width: 20,),
          Container(
            height: 60, width: 59,
            child: Image.asset(image, scale: 2.1,),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                boxShadow: [BoxShadow(
                    color: Colors.grey.shade400, spreadRadius: 2, blurRadius: 2
                )
                ], color: Colors.white
            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(type,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
              Text(price, style: TextStyle(color: Colors.blue,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),),

            ],
          ),

        ],
      );
  }
      // SizedBox(width:100,),
      // Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(21),boxShadow:[BoxShadow(color: Colors.grey.shade300,blurRadius: 2,spreadRadius: 2)],
      //     color: Colors.white
      //   ),
      //   child: Icon(Icons.remove),
      // ),
      // SizedBox(width: 6,),
      // Text(num),
      // SizedBox(width: 6,),
      // Container(
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(21),boxShadow:[BoxShadow(color: Colors.grey.shade300,blurRadius: 2,spreadRadius: 2)],
      //       color: Colors.white
      //   ),
      //   child: Icon(Icons.add),
      // ),



 Widget pickupdate(color,String dayname,String date,txtcolor){
  return Container(
    height: 80,width: 65,
    decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey.shade200,blurRadius:2,spreadRadius: 2)],
      borderRadius: BorderRadius.circular(10),color:color,
    ),
    child: Column(
      children: [
        Text(dayname,style: TextStyle(color:txtcolor,fontSize: 15,fontWeight: FontWeight.w500),),
        SizedBox(height:10,),
        Text(date,style: TextStyle(color:txtcolor,fontSize: 15,fontWeight: FontWeight.w500),)
      ],
    ),
  );
}
Widget pickuptime(time,color,txtcolor){
  return Container(
    height: 25,width:70,
    decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey.shade200,blurRadius:2,spreadRadius: 2)],
      borderRadius: BorderRadius.circular(10),color:color,
    ),
    child: Column(
      children: [
        Text(time,style: TextStyle(color:txtcolor,fontSize: 14,fontWeight: FontWeight.w500),),

      ],
    ),
  );
}
Widget orderlist(String odtype,String type1,String type2,String type3,String type4){
  return Container(
    child: Column(
      children: [
        Text(odtype,style: TextStyle(fontWeight:FontWeight.w500,fontSize: 18 ),),
        SizedBox(height: 10,),
        Text(type1,style: TextStyle(fontWeight:FontWeight.w400,fontSize: 17 ),),
        SizedBox(height: 10,),
        Text(type2,style: TextStyle(fontWeight:FontWeight.w400,fontSize: 17 ),),
        SizedBox(height: 10,),
        Text(type3,style: TextStyle(fontWeight:FontWeight.w400,fontSize: 17 ),),
        SizedBox(height: 10,),
        Text(type4,style: TextStyle(fontWeight:FontWeight.w400,fontSize: 17 ),),

      ],
    ),
  );
}
Widget button1(String name,context,dynamic height,dynamic width){
  return Center(
    child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              border:
              Border.all(color: Colors.white.withOpacity(0))),
          child: Center(
              child: Text(
                name,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w400,fontSize:18),
              )),
        )),
  );
}
Widget textfield(String name, {required TextEditingController controller}){
  return  SizedBox( width:270,height:45,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),

      child: TextFormField(textAlign: TextAlign.center,
        decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.purple)),
          hintText:name,hintStyle: TextStyle(color: Colors.white,fontSize:18,fontWeight: FontWeight.w400),
          enabledBorder:border,
          focusedErrorBorder: border,
          errorBorder: border,
        ),

      ),
    ),
  );
}
Widget reqstppls(String name,String phone){
  return Center(
    child: Container(
      height: 160,width: 350,decoration:BoxDecoration(
        color: Color(0xff6F2DA8),borderRadius: BorderRadius.circular(12)
    ),
      child: Padding(
        padding: const EdgeInsets.only(left: 17),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Row(
              children: [

                Text("Name:",style: TextStyle(fontWeight: FontWeight.w600,fontSize:21,color: Colors.white),),
                SizedBox(width: 20,),
                Text(name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text("Phone:",style: TextStyle(fontWeight: FontWeight.w600,fontSize:21,color: Colors.white),),
                SizedBox(width: 18,),
                Text(phone,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Colors.white)),
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  Container(
                    height: 36,
                    width: 84,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                        Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text(
                          "Accept",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w400,fontSize:16),
                        )),
                  ),
                  SizedBox(width:40,),
                  Container(
                    height: 36,
                    width: 84,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                        Border.all(color: Colors.white.withOpacity(0)),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text(
                          "Decline",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w400,fontSize:16),
                        )),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    ),
  );
}
Widget userslist(String name,String phone){
  return Center(
      child: Container(
          height: 130,width: 320,decoration:BoxDecoration(
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
                        Text(name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [

                        Text("Phone:",style: TextStyle(fontWeight: FontWeight.w600,fontSize:21,color: Colors.white),),
                        SizedBox(width: 20,),
                        Text(phone,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.only(left: 210),
                      child: Row(
                        children: [
                          Image.asset("assets/img_23.png",scale:1.9,),
                          SizedBox(width: 15,),
                          Image.asset("assets/img_24.png",scale:1.9,),

                        ],
                      ),
                    )
                  ]
              )
          )
      )
  );
}
Widget bulletslist(String text){
  return Padding(
    padding: const EdgeInsets.only(left:140),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '\u2022',
          style: TextStyle(
              fontSize: 40,
              height:.45,
              color: Colors.white
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          child: Text(text,
            textAlign: TextAlign.left,
            softWrap: true,
            style: TextStyle(
              fontSize:15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 1,
            ),
          ),
        ),
      ],
    ),
  );
}
// Widget mathtrailing(String $value,){
//   return Row(
//         children: [
//           InkWell(
//             onTap:(){
//               subtract();
//             },
//             child:  Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(21),boxShadow:[BoxShadow(color: Colors.grey.shade300,blurRadius: 2,spreadRadius: 2)],
//                   color: Colors.white
//               ),
//               child: Icon(Icons.remove),
//             ),),
//
//       SizedBox(width: 5,),
//       Text("$value"),
//       SizedBox(width: 5,),
//
//
//       InkWell(
//           onTap: (){
//             add();
//           },
//           child:
//           Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(21),boxShadow:[BoxShadow(color: Colors.grey.shade300,blurRadius: 2,spreadRadius: 2)],
//                   color: Colors.white
//               ),
//               child:Icon(Icons.add)
//           )
//       ),
//         ],
//       );
// }
