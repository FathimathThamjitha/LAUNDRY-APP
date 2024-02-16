import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Constant/refactoring.dart';
import '../provider/Mainprovider.dart';
import 'home.dart';
import 'mainpage.dart';

class Addmenu extends StatelessWidget {
  String from;
  String tId;
  Addmenu({super.key, required this.from, required this.tId});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Mainpg1()));
            },
            child: BackButton(
              color: Colors.white,
            )),
        title: Text(
          "Launder Type",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 23, color: Colors.white),
        ),
        backgroundColor: Color(0xff6F2DA8),
      ),
      backgroundColor: Color(0xff6F2DA8),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          InkWell(
            onTap: () {
              showBottomSheet(context);
            },
            child: Consumer<LaundryProvider>(builder: (context, value, child) {
              return value.fileImage != null
                  ? Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 70,
                        backgroundImage: FileImage(
                          value.fileImage!,
                        ),
                      ),
                    )
                  : value.imageUrl != ""
                      ? Center(
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 70,
                              backgroundImage: NetworkImage(value.imageUrl),
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
          SizedBox(
            height: 50,
          ),
          Container(
            // height: 45,
            width: 270,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),

            child: Consumer<LaundryProvider>(builder: (context, value, child) {
              return TextFormField(
                controller: value.typecontroller,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:10 ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.purple)),
                  hintText: "Type",
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                  enabledBorder: border,
                  focusedErrorBorder: border,
                  errorBorder: border,
                ),
              );
            }),
          ),
          SizedBox(
            height: 60,
          ),
          Consumer<LaundryProvider>(builder: (context, value, child) {
            return InkWell(
                onTap: () {
                  if (from == "NEW") {
                    value.addtype("NEW", '');
                  } else {
                    value.addtype("EDIT", tId);
                  }
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home1()));
                },
                child: button1(
                    "Save", context, height / 18, width / 3.5));
          })
        ],
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
                    {provider.getImagecamera(), Navigator.pop(context)}),
            ListTile(
                leading: Icon(Icons.photo, color: Colors.black),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                    {provider.getImagegallery(), Navigator.pop(context)}),
          ],
        );
      });
  //ImageSource
}
