import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:intl/intl.dart';
import 'package:laundry/Constant/myfunction.dart';
import 'package:laundry/User/orderstatus.dart';


import 'mymodels.dart';

class LaundryProvider with ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final DatabaseReference root = FirebaseDatabase.instance.ref();
  firebase_storage.Reference ref = FirebaseStorage.instance.ref("Images");

  TextEditingController typecontroller = TextEditingController();
  File? fileImage;
  String imageUrl = "";
  List<LaundryType> TypeList = [];
  List<LaundryType> filtertype = [];
  String type = "";
  TextEditingController phonecontroller = TextEditingController();



  Future<void> addtype(String from, String id) async {
    print("wwwwwwwwwwwwww");
    DateTime tod = DateTime.now();
    String stdid = tod.millisecondsSinceEpoch.toString();
    HashMap<String, Object> map = HashMap();

    map["TYPE"] = typecontroller.text.toString();
    map["DATE"] = tod;
    if (from == "NEW") {
      map["TYPEID"] = stdid;
    }
    map["ADDEDBY"] = "";


    if (fileImage != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();

      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(fileImage!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["PHOTO"] = value;

          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map['PHOTO'] = '';
      // editMap['IMAGE_URL'] = imageUrl;
    }
    if (from == "NEW") {
      db.collection("LaundryType").doc(stdid).set(map);
    } else {
      db.collection("LaundryType").doc(id).update(map);
    }
    getType();


    notifyListeners();
  }

  void setImage(File imagee) {
    fileImage = imagee;


    notifyListeners();
  }


  Future getImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // setImage(File(pickedImage.path));
      cropImage(pickedImage.path);
      // print("hjkl"+pickedImage.path);
    } else {
      print('No image selected.');
    }
  }

  Future getImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropImage(pickedImage.path);
      // setImage(File(pickedImage.path));

    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      fileImage = File(croppedFile.path);
      notifyListeners();
    }
    notifyListeners();


    // else {
    //   db.collection("LaundryType").doc(sId).update(map);
    //
    //
  }

  bool gettypeLoader = false;

  void getType() {
    gettypeLoader = true;
    db.collection("LaundryType").get().then((value1) {
      if (value1.docs.isNotEmpty) {
        TypeList.clear();
        gettypeLoader = false;
        for (var value in value1.docs) {
          TypeList.add(LaundryType(value.get('TYPEID').toString(),
            value.get('PHOTO').toString(), value.get('TYPE').toString(),

          ));
          filtertype=TypeList;
          notifyListeners();
        }
        notifyListeners();
      }
      notifyListeners();
    });
  }
  void searchProduct(item) {
    TypeList = filtertype.where(
            (a) => a.type.toLowerCase().contains(item.toLowerCase())).toList();
    notifyListeners();
  }

  void clearfn() {
    typecontroller.clear();
    fileImage = null;
    imageUrl = "";
  }

  void editType(String tId) {
    db.collection("LaundryType").doc(tId).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;

        typecontroller.text = map["TYPE"].toString();
        imageUrl = map["PHOTO"].toString();

        notifyListeners();
      }
    });
  }

  void DeleteType(tId, context) {
    db.collection("LaundryType").doc(tId).delete();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
      content: Text("Deleted"),
      backgroundColor: Color(0xff523557),
    ));
    getType();
    notifyListeners();
  }





  TextEditingController accounttypecontroller = TextEditingController();
  TextEditingController accountphonecontroller = TextEditingController();


  File? fileProfileImage;
  String ProfileimageUrl = "";
  List<CustomerList>CustList = [];


  Future<void> addAccount(String from, String uid) async {
    DateTime tod = DateTime.now();
    String phid = tod.millisecondsSinceEpoch.toString();



    HashMap<String, Object>map1 = HashMap();
    map1["NAME"] = accounttypecontroller.text;
    map1["PHONE_NUMBER"] = accountphonecontroller.text;
    map1["ADDED_TIME"] = tod;
    map1["CUSTOMER_ID"] = phid;
    map1["STATUS"] = "REQUEST";

    if (fileProfileImage != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();

      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(fileProfileImage!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map1["PHOTO"] = value;
          notifyListeners();
        });
      });
    } else {
      map1['PHOTO'] = ProfileimageUrl;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    if (from == "EDIT") {
      db.collection("CUSTOMERS").doc(uid).update(map1);
    }
    else {
      db.collection("CUSTOMERS").doc(phid).set(map1);
    }

    notifyListeners();
  }

  void setProfileImage(File imagee) {
    fileProfileImage = imagee;


    notifyListeners();
  }


  Future getProfileImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // setImage(File(pickedImage.path));
      cropProfileImage(pickedImage.path);
      // print("hjkl"+pickedImage.path);
    } else {
      print('No image selected.');
    }
  }

  Future getProfileImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropProfileImage(pickedImage.path);
      // setImage(File(pickedImage.path));

    } else {
      print('No image selected.');
    }
  }

  Future<void> cropProfileImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      fileProfileImage = File(croppedFile.path);
      notifyListeners();
    }
    notifyListeners();
  }

  bool getcustdtlsLoader = false;

  void getCustomerdtls() {
    getcustdtlsLoader = true;
    db.collection("CUSTOMERS").where("STATUS", isEqualTo: "REQUEST")
        .get()
        .then((value1) {
      CustList.clear();
      getcustdtlsLoader = false;
      if (value1.docs.isNotEmpty) {
        for (var value in value1.docs) {
          CustList.add(CustomerList(value.id.toString(),
            value.get('PHONE_NUMBER').toString(), value.get('NAME').toString(),
          ));

          notifyListeners();
        }
        notifyListeners();
      }
    });
  }

  void acceptRequest(String id, String name, String phone,
      BuildContext context) {
    HashMap<String, Object> map = HashMap();
    map["STATUS"] = "ACCEPT";
    db.collection("CUSTOMERS").doc(id).update(map);

    HashMap<String, Object> userMap = HashMap();
    userMap["NAME"] = name;
    userMap["PHONE_NUMBER"] = "+91$phone";
    userMap["TYPE"] = "USER";
    userMap["CUSTOMER_ID"] = id;
    db.collection("USERS").doc(id).set(userMap);
    ScaffoldMessenger.of(context)
        .showSnackBar(
        SnackBar(
            backgroundColor: Colors.white,

            content: Text("Approved successfully ", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.purple),
            )));

    getCustomerdtls();
    notifyListeners();
    finish(context);
  }

  void declineRequest(id, BuildContext context) {
    HashMap<String, Object> map = HashMap();
    map["STATUS"] = "DECLINE";

    db.collection("CUSTOMERS").doc(id).set(map, SetOptions(merge: true));
    finish(context);
    // ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(backgroundColor: Colors.white,
    //         content: Text("Rejected successfully ", style: TextStyle(
    //             fontWeight: FontWeight.w600, fontSize: 18, color: Colors.purple),
    //         )));
    getCustomerdtls();
    notifyListeners();
  }


  bool getCustomerLoader = false;

  void getCustomerInfo() {
    getCustomerLoader = true;
    notifyListeners();
    db.collection("CUSTOMERS").where("STATUS", isEqualTo: "ACCEPT")
        .get()
        .then((value) {
      getCustomerLoader = false;
      notifyListeners();
      CustList.clear();
      if (value.docs.isNotEmpty) {
        for (var elements in value.docs) {
          Map<String, dynamic> userinfo = elements.data();
          CustList.add(CustomerList(
            userinfo["CUSTOMER_ID"].toString(),
            userinfo["NAME"].toString(),
            userinfo["PHONE_NUMBER"].toString(),
          ));
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }



  String username = "";
  String userphoto = "";
  String usernumber = "";

  void getprsnalinfo(String pid) {
    print("hfhfhgffht");
    db.collection("CUSTOMERS").doc(pid).get().then((value) {
      if (value.exists) {
        username = value.get("NAME").toString();
        userphoto = value.get("PHOTO").toString();
        usernumber = value.get("PHONE_NUMBER").toString();
      }
      notifyListeners();
    });
    notifyListeners();
  }

  editpersonalinfo(String name, String phone, String photo) {
    accounttypecontroller.text = name;
    accountphonecontroller.text = phone;
    userphoto = photo;
    notifyListeners();
  }

  TimeOfDay _time = TimeOfDay.now();
  DateTime _date = DateTime.now();
  DateTime scheduledTime = DateTime.now();
  DateTime scheduledDate = DateTime.now();
  String scheduledDayNode = "";
  var outputDateFormat = DateFormat('dd/MM/yyyy');
  var outputTimeFormat = DateFormat('hh:mm a');
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  // Future<void> selectDateAndTime(BuildContext context) async {
  //
  //   await _selectDate(context);
  //   await _selectTime(context);
  // }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      _date = picked;
      scheduledDate = DateTime(_date.year, _date.month, _date.day);
      dateController.text = outputDateFormat.format(scheduledDate);
      notifyListeners();
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    if (picked != null) {
      _time = picked;
      scheduledDayNode =
          _date.year.toString() + '/' + _date.month.toString() + '/' +
              _date.day.toString();
      scheduledTime = DateTime(
          _date.year, _date.month, _date.day, _time.hour, _time.minute);
      timeController.text = outputTimeFormat.format(scheduledTime);
      notifyListeners();
    }
  }

  TextEditingController Addresscontroller = TextEditingController();
  // String userid="";
  // String name="";
  // String phone="";
  String dropdownvalue = 'Picked Up';
  var Type = [
    'Picked Up',
    'In Progress',
    'Out for Delivery',
    'Delivered',
  ];


  void dropdown(String? newValue) {
    dropdownvalue = newValue!;
    notifyListeners();
  }
  void addPickupdtls(String userid,String name,String phone) {
    print("pppppppppppp");
    DateTime tod = DateTime.now();
    String pkid = tod.millisecondsSinceEpoch.toString();
    HashMap<String, Object> map = HashMap();

    map["ADDRESS"] = Addresscontroller.text;
    map["PICKUP_DATE"] = dateController.text;
    map["PICKUP_TIME"] = timeController.text;
    map["PICKUP_ID"] = pkid;
    map["USER_NAME"]=name;
    map["PHONE_NUMBER"]=phone;
    map["USER_ID"]=userid;
    map["ORDER_TYPE"]='';
    map["DELIVERY_DATE"]='';
    map["PAYMENT_METHOD"]='';
    map["STATUS"] ="REQUESTED";

    db.collection("PICKUP_DETAILS").doc(pkid).set(map);

    getPickupdtls();
    notifyListeners();
  }

     // String pickupname='';
     // String pickupphone='';
     // String pickupaddress='';
  List<BookinglistModel>booklist=[];

     void getPickupdtls(){
     db.collection("PICKUP_DETAILS").get().then((value) {
       if (value.docs.isNotEmpty) {
         booklist.clear();
         for(var value in value.docs){
           Map<dynamic,dynamic>map=value.data();
            booklist.add(BookinglistModel(
                value.id,
                value.get("USER_NAME").toString(),
                value.get("PHONE_NUMBER").toString(),
                value.get("ADDRESS"),
                value.get("ORDER_TYPE").toString(),
                value.get("PICKUP_DATE").toString(),
                value.get("DELIVERY_DATE").toString(),
                value.get("PICKUP_TIME").toString(),
                value.get("PAYMENT_METHOD").toString(),
                map["ORDER_STATUS"]??"",
                value.get("STATUS").toString(),
               ));
            notifyListeners();


         }
         notifyListeners();
       }
     });
     notifyListeners();
     }

     // TextEditingController statuscontroller=TextEditingController();
     // void getUpdateStatus(String stsid){
     //   db.collection("PICKUP_DETAILS").doc(stsid).get().then((value) {
     //     if (value.exists){
     //       Map<dynamic,dynamic>map=value.data()as Map;
     //       statuscontroller.text=map["STATUS"].toString();
     //       notifyListeners();
     //     }
     //   });
     //   notifyListeners();
     //
     // }

     void updateStatus(String orderId,BuildContext context){
       HashMap<String, Object> map = HashMap();
       map["ORDER_STATUS"]=dropdownvalue;
       db.collection("PICKUP_DETAILS").doc(orderId).set(map,SetOptions(merge: true));
       finish(context);
       getPickupdtls();
     }
     
     
     String status="";
     int tick=0;
     bool loader=false;
     void getstatus(String userId)async {
       loader=true;
       db.collection("PICKUP_DETAILS").where("USER_ID",isEqualTo:userId).get().then((value) {
         if(value.docs.isNotEmpty) {
           loader=false;
           for (var elements in value.docs) {
             print(elements.toString()+"lkvhjh");
             Map<dynamic, dynamic>map = elements.data();
             status = map["ORDER_STATUS"].toString();
             notifyListeners();

             print(status+"flnhjgbhb");

             if(status=="Picked Up"){
               tick=1;
               notifyListeners();

             }
             else if(status=="In Progress"){
               tick=2;
               notifyListeners();

             }
             else if(status=="Out for Delivery"){
               tick=3;
               print("mbbbbbbbbbn");
               notifyListeners();

             }
             else if(status=="Delivered"){
               tick=4;
               notifyListeners();

             }

             print("tttiiicckk"+tick.toString());
           notifyListeners();
           }

         }
       });
       notifyListeners();
       
     }



  void acceptStatusUpdate(String id) {
    HashMap<String, Object> Acceptmap = HashMap();
    Acceptmap["STATUS"] = "Accepted";
    Acceptmap["ACCEPTED_TIME"] = DateTime.now();

    db.collection("PICKUP_DETAILS").doc(id).update(Acceptmap);
  }

  void rejectStatusUpdate(String id) {
    HashMap<String, Object> RejectMap = HashMap();
    RejectMap["STATUS"] = "Rejected";
    RejectMap["REJECTED_TIME"] = DateTime.now();
    db.collection("PICKUP_DETAILS").doc(id).update(RejectMap);
    }




  String typeselectedcategoryid = '';
  TextEditingController categoryname = TextEditingController();
  TextEditingController categoryprice = TextEditingController();
  TextEditingController laundrytypecontroller = TextEditingController();
  List<LaundrycategoryList>categorylist = [];
  List<LaundrycategoryList>default_laundrylist = [];
  File? fileCatImage;
  String imageCatUrl = "";


  Future<void> addLaundryCategory(String from, String catid,String laundry_id,BuildContext context) async {
    print("lllllllll");
    DateTime tod = DateTime.now();
    String lcod = tod.millisecondsSinceEpoch.toString();
    HashMap<String, Object>map = HashMap();

    map["CATEGORY_ID"] = lcod;
    map["CATEGORY_NAME"] = categoryname.text;
    map["CATEGORY_PRICE"] = categoryprice.text;
    // map["LAUNDRY_NAME"] = laundrytypecontroller.text;
    map["LAUNDRY_ID"] = laundry_id;


    if (fileCatImage != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();

      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(fileCatImage!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["PHOTO"] = value;

          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map['PHOTO'] = '';
      // editMap['IMAGE_URL'] = imageUrl;
    }

    if (from == "NEW") {
      db.collection("LAUNDRY_CATEGORY").doc(lcod).set(map);
    } else {
      db.collection("LAUNDRY_CATEGORY").doc(catid).update(map);
    }
    getLaundryCategory(laundry_id);
     finish(context);
    notifyListeners();
  }

  void setCatImage(File imagee) {
    fileCatImage = imagee;


    notifyListeners();
  }


  Future getCatImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // setImage(File(pickedImage.path));
      cropCatImage(pickedImage.path);
      // print("hjkl"+pickedImage.path);
    } else {
      print('No image selected.');
    }
  }

  Future getCatImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropCatImage(pickedImage.path);
      // setImage(File(pickedImage.path));

    } else {
      print('No image selected.');
    }
  }

  Future<void> cropCatImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      fileCatImage = File(croppedFile.path);
      notifyListeners();
    }
    notifyListeners();
  }

  bool getLaundryCategoryLoader = false;
double total_price1 = 0.0;
int count = 0;
double total_price_default = 0.0;
double grand_total = 0.0;
double delivery_charge = 30.0;
  void getLaundryCategory(String id) {
    // categorylist.clear();
    getLaundryCategoryLoader = true;
    db.collection("LAUNDRY_CATEGORY").where("LAUNDRY_ID", isEqualTo: id)
        .get()
        .then((value1) {
      if (value1.docs.isNotEmpty) {
        total_price1 = 0.0;
        total_price_default = 0.0;
        categorylist.clear();
        default_laundrylist.clear();
        getLaundryCategoryLoader = false;
        for (var value in value1.docs) {

          categorylist.add(
              LaundrycategoryList(value.get("CATEGORY_ID").toString(),
                value.get('PHOTO').toString(),
                value.get("CATEGORY_NAME").toString(),
                count *  double.parse(value.get("CATEGORY_PRICE").toString()),
                count ,

                 total_price1 = total_price1 + (count*double.parse(value.get("CATEGORY_PRICE").toString()))

                // value.get("LAUNDRY_NAME").toString(),
              ));
          print("TOTAL PRICE =  $total_price1");
         // total_price = total_price + double.parse(categorylist..toString());
          default_laundrylist.add(LaundrycategoryList(value.get("CATEGORY_ID").toString(),
              value.get('PHOTO').toString(),
              value.get("CATEGORY_NAME").toString(),
              double.parse(value.get("CATEGORY_PRICE").toString()),
              count,
              total_price_default= total_price_default +(count* double.parse(value.get("CATEGORY_PRICE").toString()))

            // value.get("LAUNDRY_NAME").toString(),
          ));
          notifyListeners();
        }
        notifyListeners();
      }
      notifyListeners();
    });
  }

  void editCategoryType(String ecid) {
    db.collection("LAUNDRY_CATEGORY").doc(ecid).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;

        categoryname.text = map["CATEGORY_NAME"].toString();
        categoryprice.text = map["CATEGORY_PRICE"].toString();
        imageCatUrl = map["PHOTO"].toString();

        notifyListeners();
      }
    });
  }

  void DeleteCategoryType(String dcid, BuildContext context) {
    db.collection("LAUNDRY_CATEGORY").doc(dcid).delete();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
      content: Text("Deleted"),
      backgroundColor: Color(0xff523557),
    ));
    getLaundryCategory(dcid);
    notifyListeners();
  }

  void clearcatfn() {
    categoryname.clear();
    categoryprice.clear();
    fileCatImage = null;

  }


  void Inrement(int count, String id, double basic_price) {

    for (var e in categorylist) {
      if (e.id == id) {
        if (count > 0) {
          e.price = basic_price * count;
        }
        find_total(id);
        notifyListeners();
      }
    }
    notifyListeners();
  }
  void find_total(String id)
  {
    total_price1 = 0.0;

    print("total_price11111111111111111 = $total_price1");
    print("grand total = $grand_total");
    for (var e in categorylist) {
      print("total_price1 = $total_price1");
      total_price1 = total_price1 + e.price;
    //     total_price2 = total_price1;
    // total_price3 = total_price1;
    // total_price4 = total_price1;
    // total_price5 = total_price1;
    // total_price6 = total_price1;
        print("total= $total_price1");

        notifyListeners();

    }
    //grand_total = grand_total + total_price1;
      }

    void decrement(int count, String id,double price,double basic_price)
    {
      double amount=0;
      for (var e in categorylist) {
        if (e.id == id  && e.count>0) {
          e.count--;
          e.price = basic_price * e.count;
          find_total(id);
          notifyListeners();
        }
      }
      notifyListeners();
    }

    //FIND GRAND TOTAL
  List<double> total_list = [];
  void find_grand_total()
  {

    for(var e in total_list)
      {
        grand_total = grand_total + e;
      }
  }

    List<WashlistModel>wash_list=[];
  void Order_Details (){
    HashMap<String,dynamic>Main_map=HashMap();
    HashMap<String,dynamic>Category_map=HashMap();
    for(var e in wash_list){
      HashMap<String,dynamic>item_map=HashMap();
      item_map["COUNT"]=e.count;
      item_map["PRICE"]=e.price;
      Category_map[e.item]=item_map;
    }
    for(var e in TypeList){
      Category_map[e.type]=Category_map;
    }
    Main_map["CATEGORY"]=Category_map;

  }



  
}
