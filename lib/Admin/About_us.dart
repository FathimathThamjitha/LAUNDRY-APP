import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Mainprovider.dart';


class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // LaundryProvider provider = Provider.of<LaundryProvider>(context,listen: false);
    // provider.getAboutUs();
    return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height:height/7,),
                  Consumer<LaundryProvider>(
                    builder: (context,value,child) {
                      return 
                        Container(margin: EdgeInsets.all(10),
                        height: height,
                        width: width,
                        child: Column(
                          children: [
                            
                            Text("Laundry Loft",style: TextStyle(color: Colors.black,fontSize:29,fontWeight: FontWeight.w600),),
                            SizedBox(height: 30,),
                            Text("Laundramoon offers commercial laundry services for businesses that needs it. We collect directly from our customers and deliver back clean clothes within their preferred time slot. As a commercial laundry service provider in London, we are committed to providing high-quality laundry services that save businesses time and money while ensuring a safe and hygienic environment for their customers and staff. We take pride in our commitment to quality, reliability, and customer satisfaction, and we look forward to working with businesses of all sizes.",style: TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.w500),)
                          ],
                        ),
                      );
                    }
                  )

              ],
            ),
          ),



    );


  }
}
