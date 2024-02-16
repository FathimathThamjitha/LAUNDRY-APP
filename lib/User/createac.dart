import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laundry/Constant/myfunction.dart';
import 'package:laundry/Constant/refactoring.dart';
import 'package:laundry/provider/Mainprovider.dart';
import 'package:provider/provider.dart';

import 'bottomnavigation.dart';
import 'login.dart';

class CreateAc extends StatelessWidget {
  String from;
  String loginuserid;
   CreateAc({super.key,required this.from,required this.loginuserid,});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,width: width,
    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img_3.png"),
    fit: BoxFit.fitWidth,alignment: Alignment.center
    )),
   child:  Scaffold(backgroundColor: Colors.transparent,
       body: SingleChildScrollView(
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.only(top: 330,right:140),
               child: Text("Create Account",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 26),),
             ),
             Align(alignment: Alignment.centerLeft,),
             SizedBox(height:20,),
             InkWell(
               onTap: () {
                 showBottomSheet(context);
               },
               child: Consumer<LaundryProvider>(builder: (context, value, child) {
                 return value.fileProfileImage != null
                     ? Center(
                   child: CircleAvatar(
                     backgroundColor:Color(0xff6F2DA8),
                     radius: 70,
                     backgroundImage: FileImage(
                       value.fileProfileImage!,
                     ),
                   ),
                 )
                     : value.ProfileimageUrl != ""
                     ? Center(
                   child: CircleAvatar(
                     backgroundColor: Color(0xff6F2DA8),
                     radius: 70,
                     backgroundImage: NetworkImage(value.ProfileimageUrl),
                   ),
                 )
                 :value.userphoto !=""?
                 Center(
                   child: CircleAvatar(
                     backgroundColor: Color(0xff6F2DA8),
                     radius: 70,
                     backgroundImage: NetworkImage(value.userphoto),
                   ),
                 )
                     : Center(
                   child: CircleAvatar(
                       backgroundColor: Color(0xff6F2DA8),
                       radius: 70,
                       child: Icon(
                         Icons.image,
                         size: 90,
                         color: Colors.grey.shade200,
                       )),
                 );
               }),
             ),             SizedBox(height: 30,),

             Container(
               child: SizedBox(
                 width:320,height:55,
                 child: Consumer<LaundryProvider>(
                   builder: (context,value,child) {
                     return TextFormField(
                       controller: value.accounttypecontroller,
                       maxLines: 5,
                       decoration:
                       InputDecoration(focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                           borderSide: BorderSide(color: Colors.purple.shade700,)),
                         enabledBorder:border,
                         focusedErrorBorder: border,
                         errorBorder: border,
                         // OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                         //     borderSide: BorderSide(color: Colors.grey.shade400,)),


                         prefixIcon:Icon(Icons.person,color: Colors.grey.shade600,),
                         hintText: "User Name",hintStyle: TextStyle(color: Colors.grey.shade400,fontSize: 16,fontWeight: FontWeight.w400)
                       ),



                     );
                   }
                 ),
               ),
               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(15),
                   boxShadow: [BoxShadow(color: Colors.grey.shade400,blurRadius: 3)]
               ),
             ),
             SizedBox(height: 5,),
             SizedBox(height: 20
               ,),
             Container(
               child: SizedBox(
                 width:320,
                 height:55,
                 child: Consumer<LaundryProvider>(
                   builder: (context,value,child) {
                     return TextFormField(keyboardType: TextInputType.number,
                       inputFormatters: [LengthLimitingTextInputFormatter(10)],
                       controller: value.accountphonecontroller,
                       maxLines: 5,
                       enabled: from=="EDIT"?false:true,
                       decoration:
                       InputDecoration(focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                           borderSide: BorderSide(color: Colors.purple.shade700,)),
                         enabledBorder:border,
                         focusedErrorBorder: border,
                         errorBorder: border,
                         // OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                         //     borderSide: BorderSide(color: Colors.grey.shade400,)),


                         prefixIcon:Icon(Icons.call_outlined,color: Colors.grey.shade600,),
                         hintText: "Contact Number",hintStyle: TextStyle(color: Colors.grey.shade400,fontSize: 16,fontWeight: FontWeight.w400)
                       ),



                     );
                   }
                 ),
               ),

               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(15),
                   boxShadow: [BoxShadow(color: Colors.grey.shade400,blurRadius: 3)]
               ),
             ),
             Consumer<LaundryProvider>(
               builder: (context,value,child) {
                 print("from = $from");
                 return Visibility(

                   visible: from=="LOGIN"||from=="EDIT"?false:true,
                   child: Column(
                     children: [
                       ListTile(
                         title: Text("Admin",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                         leading: Radio(value: "ADMIN", groupValue: value.type, onChanged: (value1){
                          value.type=value1!;
                          value.notifyListeners();
                         }),
                       ),
                       ListTile(
                         title: Text("User",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                         leading: Radio(value: "USER", groupValue: value.type, onChanged: (value1){
                           value.type=value1!;
                           value.notifyListeners();
                         }),
                       ),


                     ],
                   ),
                 );
               }
             ),
             SizedBox(height: 10,),
             Consumer<LaundryProvider>(
               builder: (context,value,child) {
                 return GestureDetector(
                   onTap: (){

                     if(from=="EDIT"){
                       value.addAccount(from, loginuserid);
                       finish(context);
                     }
                     else{
                       value.addAccount(from,loginuserid);

                       callNextReplacement(context, Login());
                     }

                   },
                     child: button("Submit", height/17, width/2.5,));
               }
             )
           ],
         ),
       ),
     ),
    );
  }
}
void showBottomSheet(BuildContext context) {
  LaundryProvider provider =
  Provider.of<LaundryProvider>(context, listen: false);

  showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          )),
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(
                  Icons.camera_enhance_sharp,
                  color: Colors.black,
                ),
                title: const Text(
                  'Camera',
                ),
                onTap: () =>
                {provider.getProfileImagecamera(), Navigator.pop(context)}),
            ListTile(
                leading: Icon(Icons.photo, color: Colors.black),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                {provider.getProfileImagegallery(), Navigator.pop(context)}),
          ],
        );
      });
  //ImageSource
}
