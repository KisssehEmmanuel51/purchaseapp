import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purchase/purchace/payment.dart';
import 'package:purchase/purchace/purchase_home.dart';
import 'package:purchase/purchace/report.dart';
import 'package:purchase/purchace/sales_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
          children: [
            // top image
            SizedBox(
              height: 200.0,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/computerSoftware.png')
                  )
                ),
                alignment: Alignment.center,
                height: 350.0,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,

                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('Trust us with all your software problems',
                    style: TextStyle(color: Colors.black87, fontSize: 12.0,fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
            Divider(
              height: 20.0,
            ),
            //buttons
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage ()));
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                     // PURCHASE BUTTON
                        Card(
                          child: InkWell(

                            child: Container(
                              height: 100.0,
                              width: 100.0,
                              child: Center(child: Text('PURCHASE')),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>purchasePage()));
                            },

                          ),
                          shadowColor: Colors.blueAccent,
                          elevation: 5,
                        ),
                        // sales button

                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MylistDynamics()));
                          },
                          child: Card(
                            child: Container(
                              height: 100.0,
                              width: 100.0,
                              child: Center(child: Text('SALES')),
                            ),
                            shadowColor: Colors.red,
                            elevation: 5,
                          ),
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // button payment
                        Card(
                          child: InkWell(
                            child: Container(
                              height: 100.0,
                              width: 100.0,
                              child: Center(child: Text('PAYMENT')),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage()));

                            },
                          ),
                          shadowColor: Colors.blueAccent,
                          elevation: 5,
                        ),
                         // REPORT BUTTON
                         InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportPage()));

                           },
                           child: Card(
                              child: Container(

                                height: 100.0,
                                width: 100.0,
                                child: Center(child: Text('REPORT')),
                              ),
                              shadowColor: Colors.red,
                              elevation: 5,
                            ),
                         ),


                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
