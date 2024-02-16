import 'package:flutter/material.dart';
import 'package:laundry/User/persinalinfo.dart';
import 'package:provider/provider.dart';

import '../provider/Mainprovider.dart';
import 'home.dart';
import 'orderdtls.dart';

class Bottom extends StatefulWidget {

  String userid;
  String name;
  String phone;
   Bottom({super.key,required this.name,required this.phone,required this.userid});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int selectedIndex = 0;




  @override
  void _itemTapped(int index){
    LaundryProvider mainProvider = Provider.of<LaundryProvider>(context, listen: false);
    setState(() {
      selectedIndex = index;
      print(selectedIndex.toString()+"ppkk");
      if(selectedIndex==2){
        mainProvider.getprsnalinfo(widget.userid);
      }
    });

  }
  Widget build(BuildContext context) {
    print("kvlnvjvbjf"+widget.userid);
    var pages = [
      Home(name: widget.name,phone: widget.phone,userid: widget.userid),
      Order(name: widget.name,phone: widget.phone,userid: widget.userid),
      Personal( name: widget.name,phone: widget.phone,userid: widget.userid)
    ];
    print(selectedIndex.toString()+"ijkjkj");
    return Scaffold(
      body: pages[selectedIndex],
      extendBody: true,
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // margin: EdgeInsets.zero,marginR: EdgeInsets.zero,paddingR: EdgeInsets.zero,
        // enableFloatingNavBar: true,
        selectedItemColor: Color(0xff6F2DA8),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white.withOpacity(1),
        currentIndex: selectedIndex,

        onTap: _itemTapped,
        items: [
          BottomNavigationBarItem(label: "",

            icon: Icon(Icons.home,size: 33,),
          ),
          BottomNavigationBarItem(label: "",
            icon: Icon(Icons.shopping_basket,size:33),),

           BottomNavigationBarItem(label: "",
            icon: Icon(Icons.person,size: 33,),

          ),
        ],

      ),
    );
  }
}

