
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:laundry/User/splashscreen.dart';
import 'package:laundry/provider/Mainprovider.dart';
import 'package:laundry/provider/loginprovider.dart';
import 'package:provider/provider.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
         ChangeNotifierProvider(create:  (context)=>LaundryProvider()),
        ChangeNotifierProvider(create:  (context)=>LoginProvider())

      ],
      child:MaterialApp(
    debugShowCheckedModeBanner:false,
      theme: ThemeData(
    // colorScheme:ColorScheme.fromSeed(seedColor: seedColor:Colors.) ,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        home:  SplashScreen(userid: '',phone: '',name: ''),
      ),
    );
  }
}
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       final FirebaseFirestore db = FirebaseFirestore.instance;
//       HashMap<String, Object> map = HashMap();
//
//       map["type"] = "Washing";
//       map["photo"] = Image.asset("img_5.png");
//       map["date"] = "24,11,2023";
//       DateTime now = DateTime.now();
//
//       String id = now.millisecondsSinceEpoch.toString();
//       db.collection("LaundryType").doc(id).set(map);
//
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

