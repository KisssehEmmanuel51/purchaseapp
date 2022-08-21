import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purchase/purchace/classes/date_class.dart';
 final String _searchorder='';
class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String _payproducts = 'Select product';
  List<String> _payproductList = [
    'Select product',
    'MK 20+ 20Kg',
    'MK 25+ 20Kg',
    'MK 16+ 20Kg',
    //'MK 16+ 20Kg',
    'MK 10Kg DS',
    'HM 16+ 20Kg',
    'HM 25+ 20Kg',
    'HM 20+ 20Kg',
    'HM 25+ 30Kg',
    'MK 20+ 30Kg',
    'HM 16+ 30Kg',
    'HM 14+ 20Kg',
    'HM 14+ 30Kg',
    'HM 12+ 20Kg',
    'HM 12+ 30Kg',
    'HM 10+ 20Kg',
    'HM 10+ 30Kg',
    '2BRO 20Kg',
    '2BRO 30K',
    'SARDINE 20Kg',
    'SARDINE 30Kg',
    'AMANE 20g',
    'AMANE 30Kg',
    'BONITO 20Kg',
    'BONITO 30Kg',
    'LIALIA 20Kg',
    'LIALIA 27Kg',
    'BRAMA 20Kg',
    'BRAMA 27Kg',
    'MACHEL 15Kg',
    'HM 10Kg',
    'HM 15Kg',
    'CUTLASS FISH 20Kg',
    'CUTLASS FISH 30Kg',
    'STOMA 20Kg',
    'HAKE 10Kg',
    'HAKE 20Kg',
    'HAKE 30Kg',
    'HAKE SMALL SIZES',
    '25 FLAT',
    'REDFISH BOX',
    'REDFISH 10Kg',
    'TUNA 10Kg',
    'TUNA 20Kg',
    'TUNA 27Kg',
    'PAGO 4P',
    'PAGO P',
    'DENTEX LONG',
    'SPRATE 20Kg',
    'OPAA 10Kg',
    'OPAA 20Kg',
    'CK BACK',
    'CK LAYER',
    'CK HOLLAND',
    'CK BRAZIL',
    'CK FULL',
    'CK SAUSAGE',
    'BEEF SAUSAGE',
    'US DRUM STICKS',
    'HOLLAND DRUM STICKS',
    'US MANTRE',
    'CK WINGS',
    'TURKY WINGS',
    'NTITIN',
    'TRIPEX',
    'OTHER',
  ];

  // select company from dropdown
  String _paycompany_name = 'Select company';
  List<String> _paycompanyList = [
    'Select company',
    'WE 2 CO LTD',
    'AFRICA FISH CO',
    'DOLFEN FRONZEN',
    'NORTH SOUTH',
    'OCEAN FARE',
    'MR YEBOAH',
    'MARANATHA',
    'KUMASI DOMFE'
  ];

  // Quatar
  String _payquarter = 'Select quarter';
  List<String> _payquarterList = ['Select quarter', '1', '2', '3', '4'];

  CollectionReference PaymentRecieverReff= FirebaseFirestore.instance.collection('Payment');

  TextEditingController _sortbyReceipt=TextEditingController();
  TextEditingController _sortbydate=TextEditingController();
  String _sortOrder='';
   Future<void>deleteReport(String ReportId)async{
     PaymentRecieverReff.doc(ReportId).delete();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/searchbb.png')
                  )
                ),
                child:Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.search,size: 120,
                    color: Colors.grey,
                  ),
                )
            ),
               Text('Select your search order'),
               Divider(),
               Divider(),
            //Sort by Receipt number
            InkWell(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(6, 7)),
                        ),
                        title: Center(
                            child: Text('Enter Receipt number',style:
                            TextStyle(fontSize: 12),)),
                        children: [

                          ListTile(

                              subtitle: IconButton(
                                onPressed: () {
                                   setState((){
                                     _sortOrder==_sortbyReceipt;
                                   });
                                   Navigator.pop(context);
                                },
                                icon: Icon(Icons.search_off,color: Colors.black87,size: 50.0,)
                              ),
                            title:Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(

                                keyboardType: TextInputType.text,
                                controller:_sortbyReceipt,

                                decoration: InputDecoration(

                                    labelText: 'Receipt number',

                                    prefixStyle: TextStyle(color: Colors.black),
                                    hintText: 'Receipt munber ',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 23.0, color: Colors.black))),

                              ),
                            ),
                          )
                        ],
                      );
                    });






              },
              child: ListTile(
                leading: Text('Sort by receipt no:'),
                trailing: Icon(Icons.book, color: Colors.black87,),
              ),
            ),
            //sort by company
            InkWell(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(6, 7)),
                        ),
                        title: Center(
                            child: Text('Select company',style:
                            TextStyle(fontSize: 12),)),
                        children: [

                          ListTile(

                            subtitle: IconButton(
                                onPressed: () {
                                  setState((){
                                    _sortOrder==_sortbyReceipt;
                                  });
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.search_off,color: Colors.black87,size: 50.0,)
                            ),
                            title:Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              // color: Colors.white,
                              height: 40,
                              width: 200.0,
                              child: DropdownButton(
                                hint: Text(
                                  'Select company',
                                  style: TextStyle(
                                      backgroundColor: Colors.white, color: Colors.white),
                                ),
                                alignment: AlignmentDirectional.center,
                                value: _paycompany_name,
                                onChanged: (value) {
                                  setState(() {
                                    _paycompany_name = value.toString();
                                  });
                                },
                                items: _paycompanyList.map((itemone) {
                                  return DropdownMenuItem(
                                      value: itemone,
                                      child: Text(
                                        itemone,
                                        style: TextStyle(
                                            backgroundColor: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ));
                                }).toList(),
                              ),
                            ),
                          )
                        ],
                      );
                    });

              },
              child: ListTile(
                leading: Text('Sort by company'),
                trailing: Icon(Icons.account_balance_wallet_rounded),
              ),
            ),
            //sort by date
            InkWell(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(6, 7)),
                        ),
                        title: Center(
                            child: Text('Enter date  in this format \n\ mm /dd/yyyy:',style:
                            TextStyle(fontSize: 12),)),
                        children: [

                          ListTile(

                            subtitle: ElevatedButton(
                                onPressed: () {
                                  setState((){
                                    _sortOrder==_sortbyReceipt;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.search_off,color: Colors.white,)
                            ),
                            title:Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(

                                keyboardType: TextInputType.text,
                                controller:_sortbyReceipt,

                                decoration: InputDecoration(

                                    labelText: 'Enter Date',

                                    prefixStyle: TextStyle(color: Colors.black),
                                    hintText: 'mm /dd /yyyy',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 23.0, color: Colors.black))),

                              ),
                            ),
                          )
                        ],
                      );
                    });
              },
              child: ListTile(
                leading: Text('Sort by date'),
                trailing: Icon(Icons.date_range),
              ),
            ),
            //sort by product
            InkWell(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(6, 7)),
                        ),
                        title: Center(
                            child: Text('Select company',style:
                            TextStyle(fontSize: 12),)),
                        children: [

                          ListTile(

                            subtitle: IconButton(
                                onPressed: () {
                                  setState((){
                                    _sortOrder==_sortbyReceipt;
                                  });
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.search_off,color: Colors.black87,size: 50.0,)
                            ),
                            title:Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              // color: Colors.white,
                              height: 40,
                              width: 200.0,
                              child: DropdownButton(
                                hint: Text(
                                  'Select company',
                                  style: TextStyle(
                                      backgroundColor: Colors.white,
                                      color: Colors.white),
                                ),
                                alignment: AlignmentDirectional.center,
                                value: _payproducts,
                                onChanged: (value) {
                                  setState(() {
                                    _payproducts = value.toString();
                                  });
                                },
                                items: _payproductList.map((itemone) {
                                  return DropdownMenuItem(
                                      value: itemone,
                                      child: Text(
                                        itemone,
                                        style: TextStyle(
                                            backgroundColor: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ));
                                }).toList(),
                              ),
                            ),
                          )
                        ],
                      );
                    });
              },
              child: ListTile(
                leading: Text('Sort by product'),
                trailing: Icon(Icons.account_balance_wallet_rounded),
              ),
            ),


          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('REPORTS',style: TextStyle(
          color: Colors.white,fontWeight: FontWeight.bold
        ),),
        centerTitle: true,

      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: PaymentRecieverReff.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
              document.data()! as Map<String, dynamic>;
              return Card(
                  elevation: 20.0,
                  color: Colors.white,
                  surfaceTintColor: Colors.yellow,
                  child:Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListTile(
                      title:Row(
                        children: [
                          Text('COMPANY NAME:  ',style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          Expanded(
                              flex: 1,
                              child: Text(data["COMPANY"],style:TextStyle(fontSize: 14.0),)),
                        ],
                      ) ,
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Product   ',style: TextStyle(color: Colors.black),),
                              Text('     Qty',style: TextStyle(color: Colors.black)),
                              Text('  Price',style: TextStyle(color: Colors.black)),
                              Text('           Total',style: TextStyle(color: Colors.black)),
                            ],
                          ),
                          Row(children: [
                            Text(data['product name2']+':     ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(data['Q2']+'     '),
                            Text(data['p2']+'       '),
                            Expanded(child: Text(data['t2']+'         ')),



                          ],),
                             Row(children: [
                            Text(data['product name3']+':     ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(data['Q3']+'     '),
                            Text(data['p3']+'       '),
                           Expanded(child: Text(data['t3']+'         ')),

                                ],),
                          Row(children: [
                            Text(data['product name4']+':     ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(data['Q4']+'     '),
                            Text(data['p4']+'       '),
                            Expanded(child: Text(data['t4']+'         ')),


                          ],),
                          Row(children: [
                            Text(data['product name5']+':     ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(data['Q5']+'     '),
                            Text(data['p5']+'       '),
                            Expanded(child: Text(data['t5']+'         ')),


                          ],),
                          Row(children: [
                            Text(data['product name6']+':     ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(data['Q6']+'     '),
                            Text(data['p6']+'       '),
                            Expanded(child: Text(data['t6']+'         ')),


                          ],),
                          Row(children: [
                            Text(data['product name7']+':     ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(data['Q7']+'     '),
                            Text(data['p7']+'       '),
                            Expanded(child: Text(data['t7']+'         ')),


                          ],),
                          Row(children: [
                            Text(data['product name8']+':     ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(data['Q8']+'     '),
                            Text(data['p8']+'       '),
                            Expanded(child: Text(data['t8']+'         ')),


                          ],),
                          Row(children: [
                            Text(data['product name9']+':     ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(data['Q9']+'     '),
                            Text(data['p9']+'       '),
                            Expanded(child: Text(data['t9']+'         ')),


                          ],),
                          Row(children: [
                            Text(data['product name10']+':     ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(data['Q10']+'     '),
                            Text(data['p10']+'       '),
                            Expanded(child: Text(data['t10']+'         ')),


                          ],),

                          Row(
                            children: [
                              Text("TOTAL : GH¢",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                              Text(data['Gtotal'])
                            ],
                          ),
                          Row(
                            children: [
                              Text("PAYMENT : GH¢",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                              Text(data['Payment'])
                            ],
                          ),
                          Row(
                            children: [
                              Text("BALANCE : GH¢",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                              Text(data['Balance'])
                            ],
                          ),




                          Text(data['DATE']),
                          // Buttons
                          Row(
                            children: [
                              // update button
                              ElevatedButton(onPressed: (){

                              }, child: Text('Update')),
                              SizedBox(width: 100,),
                              // delete
                              ElevatedButton(onPressed: (){
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SimpleDialog(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.elliptical(6, 7)),
                                        ),
                                        title: Center(
                                            child: Text('Are you sure you want to delete this file??',style:
                                            TextStyle(fontSize: 12),)),
                                        children: [

                                          ListTile(
                                              trailing: ElevatedButton(
                                                onPressed: () {
                                                  deleteReport(document.id);

                                                  myToast(
                                                      'Deleted !');
                                                  Navigator.pop(context);

                                                  //Navigator.of(context);
                                                },
                                                child: Text('Delete'),
                                              ),
                                              leading: TextButton(
                                                onPressed: () {
                                                  // Navigator.of(context);

                                                  Navigator.maybePop(context);
                                                },
                                                child: Text(
                                                  'EXIT',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 15),
                                                ),
                                              ))
                                        ],
                                      );
                                    });
                              }, child: Text('Delete')),

                            ],
                          )
                        ],
                      ),

                    ),
                  )
                  //Text(data['comment'])
              );
            }).toList(),
          );
        },
      )
    );
  }
}
///"RECEPT NO:": _receptNo.text,
//         "STOCK PRICE": _stockPrice.text,
//         "PAYMENT": _payment.text,
//         "BALANCE": _balace.text,
//         "PRICE": _price.text,
//          "PRODUCT": _payproducts.toString(),
//         "COMPANY": _paycompany_name.toString(),
//          "QUATAR": _payquarter.toString(),
//         "DATE":