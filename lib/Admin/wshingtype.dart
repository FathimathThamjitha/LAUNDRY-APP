
import 'package:flutter/material.dart';
import 'package:laundry/Admin/washing.dart';
import 'package:laundry/Constant/myfunction.dart';
import 'package:laundry/provider/Mainprovider.dart';
import 'package:provider/provider.dart';

import '../Constant/refactoring.dart';
import '../provider/mymodels.dart';

class AddWashtype extends StatefulWidget {
  String from;
  String wId;
  String laundryId;

   AddWashtype({super.key,required this.from,required this.wId,required this.laundryId});

  @override
  State<AddWashtype> createState() => _AddWashtypeState();
}

class _AddWashtypeState extends State<AddWashtype> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String dropdownValue ='Washing';

    return Scaffold(
      appBar: AppBar(
        leading:GestureDetector  (
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Washing1(lid: '',wname: '',)));
            },
            child: BackButton(color: Colors.white,)),
        title: Text("Washing Type",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 23,color: Colors.white),),
        backgroundColor: Color(0xff6F2DA8),
      ),
      backgroundColor: Color(0xff6F2DA8),
          body:
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      showBottomSheet(context);
                    },
                    child: Consumer<LaundryProvider>(builder: (context, value, child) {
                      return value.fileCatImage != null
                          ? Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 70,
                          backgroundImage: FileImage(
                            value.fileCatImage!,
                          ),
                        ),
                      )
                          : value.imageCatUrl != ""
                          ? Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 70,
                          backgroundImage: NetworkImage(value.imageCatUrl),
                        ),
                      )
                          : Center(
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 70,
                            child: Icon(
                              Icons.image,
                              size: 90,
                              color: Colors.grey.shade500,
                            )),
                      );
                    }),
                  ),



                  SizedBox(height: 50,),
                  SizedBox( width:270,height:45,
                  child: Container(
                  decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                  ),

                  child: Consumer<LaundryProvider>(
                    builder: (context,value,child) {
                      return TextFormField(
                        controller: value.categoryname,
                        textAlign: TextAlign.center,
                      decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.purple)),
                      hintText:"Type Name",hintStyle: TextStyle(color: Colors.white,fontSize:18,fontWeight: FontWeight.w400),
    enabledBorder:border,
    focusedErrorBorder: border,
    errorBorder: border,
    ),

    );
                    }
                  ),
    ),
    ),
                  SizedBox(height: 30,),
    SizedBox( width:270,height:45,
    child: Container(
    decoration: BoxDecoration(
    color: Colors.white.withOpacity(0.2),
    borderRadius: BorderRadius.circular(15),
    ),

    child: Consumer<LaundryProvider>(
      builder: (context,value,child) {
        return TextFormField(
              controller: value.categoryprice,
              textAlign: TextAlign.center,
        decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.purple)),
        hintText:"Type Price",hintStyle: TextStyle(color: Colors.white,fontSize:18,fontWeight: FontWeight.w400),
        enabledBorder:border,
        focusedErrorBorder: border,
        errorBorder: border,
        ),
          keyboardType: TextInputType.number,

        );
      }
    ),
    ),

    ),


                SizedBox(height: 30,),
                  // SizedBox(
                  //   width: width / 1.5,
                  //   child: Consumer<LaundryProvider>(
                  //       builder: (context, value, child) {
                  //         return Autocomplete<LaundryType>(
                  //           optionsBuilder: (TextEditingValue textEditingValue) {
                  //             return value.TypeList
                  //                 .where((LaundryType item) => item.type
                  //                 .toLowerCase()
                  //                 .contains(textEditingValue.text.toLowerCase()))
                  //                 .toList();
                  //           },
                  //           displayStringForOption: (LaundryType option) =>
                  //           option.type,
                  //           fieldViewBuilder: (BuildContext context,
                  //               TextEditingController fieldTextEditingController,
                  //               FocusNode fieldFocusNode,
                  //               VoidCallback onFieldSubmitted) {
                  //             WidgetsBinding.instance.addPostFrameCallback((_) {
                  //               // fieldTextEditingController.text =
                  //               //     value.categorycontroller.text;
                  //             });
                  //
                  //             return SizedBox(
                  //               child: Material(
                  //                 elevation: 5,
                  //                 borderRadius: BorderRadius.circular(15),
                  //                 child: TextFormField(
                  //                   decoration: InputDecoration(
                  //
                  //                     contentPadding: const EdgeInsets.symmetric(
                  //                         vertical: 10, horizontal: 16),
                  //                     hintStyle: const TextStyle(color: Colors.white,
                  //                         fontSize: 15,
                  //                         fontWeight: FontWeight.w500,
                  //                         fontFamily: "Montserrat"),
                  //                     fillColor: Colors.white,
                  //                     filled: true,
                  //                     border: OutlineInputBorder(
                  //                         borderRadius: BorderRadius.circular(5)),
                  //
                  //                     hintText:"Select MainCategory",
                  //
                  //                     suffixIcon: const Icon(
                  //                       Icons.keyboard_arrow_down_sharp,
                  //                       size: 25,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                   // validator: (value2) {
                  //                   //   if (value2!.trim().isEmpty ||
                  //                   //       !value.mainCategorylist
                  //                   //           .map((item) => item.name)
                  //                   //           .contains(value2)) {
                  //                   //     return "Please Select Your Category";
                  //                   //   } else {
                  //                   //     return null;
                  //                   //   }
                  //                   // },
                  //                   onChanged: (txt) {
                  //                     if(txt==''){
                  //                       value.laundrytypecontroller.clear();
                  //                     }
                  //                   },
                  //                   controller: fieldTextEditingController,
                  //                   focusNode: fieldFocusNode,
                  //                 ),
                  //               ),
                  //             );
                  //           },
                  //           onSelected: (LaundryType selection) {
                  //             value.laundrytypecontroller.text =
                  //                 selection.type.toString();
                  //             value.typeselectedcategoryid = selection.id;
                  //             // print("jhdbjwhdbndb"+value.productSelectedCategoryID.toString());
                  //           },
                  //           optionsViewBuilder: (BuildContext context,
                  //               AutocompleteOnSelected<LaundryType> onSelected,
                  //               Iterable<LaundryType> options) {
                  //             return Align(
                  //               alignment: Alignment.topLeft,
                  //               child: Material(
                  //                 child: Container(
                  //                   width: MediaQuery.of(context).size.width /1.5,
                  //                   height: MediaQuery.of(context).size.height/8,
                  //                   color: Colors.white.withOpacity(0.2),
                  //                   child: ListView.builder(
                  //                     padding: const EdgeInsets.all(10.0),
                  //                     itemCount: options.length,
                  //                     itemBuilder: (BuildContext context, int index) {
                  //                       final LaundryType option =
                  //                       options.elementAt(index);
                  //
                  //                       return GestureDetector(
                  //                         onTap: () {
                  //                           onSelected(option);
                  //                         },
                  //                         child: Container(
                  //                           color: Colors.white,
                  //                           height: 50,
                  //                           width: MediaQuery.of(context).size.width *
                  //                               0.86,
                  //                           child: Column(
                  //                               crossAxisAlignment:
                  //                               CrossAxisAlignment.start,
                  //                               children: [
                  //                                 Center(
                  //                                   child: Text(option.type,
                  //                                       style: const TextStyle(
                  //                                           fontWeight:
                  //                                           FontWeight.bold)),
                  //                                 ),
                  //
                  //                                 const SizedBox(height: 10)
                  //                               ]),
                  //                         ),
                  //                       );
                  //                     },
                  //                   ),
                  //                 ),
                  //               ),
                  //             );
                  //           },
                  //         );
                  //       }),
                  // ),



                  SizedBox(height:60,),
                  Consumer<LaundryProvider>(
                    builder: (context,value,child) {
                      return InkWell(

                          onTap: (){

                            if (widget.from == "NEW") {
                              value.addLaundryCategory("NEW", '',widget.laundryId,context);
                            } else {
                              value.addLaundryCategory("EDIT", widget.wId,widget.laundryId,context);
                            }
                            finish(context);
                          },
                          child: button1("Save", context, height/18, width/3.5));
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
                onTap: ()
                {
                  provider.getCatImagecamera();
                  Navigator.pop(context);
                }),
            ListTile(
                leading: Icon(Icons.photo, color: Colors.black),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                {provider.getCatImagegallery(), Navigator.pop(context)}),
          ],
        );
      });
  //ImageSource
}

