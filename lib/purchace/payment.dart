import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchase/purchace/classes/date_class.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  // PRODUCTS LIST
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

  TextEditingController _receptNo = TextEditingController();
  TextEditingController _stockPrice = TextEditingController();
  TextEditingController _payment = TextEditingController();
  TextEditingController _balace = TextEditingController();
  TextEditingController quantity = TextEditingController();
  final PaymentReff = FirebaseFirestore.instance.collection('Payment');
  // let settings = Firestore.firestore().settings
  // settings.cacheSizeBytes = FirestoreCacheSizeUnlimited;
  // Firestore.firestore().settings = settings
  // FirebaseFirestore.instance.settings =
  // Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  AddPayment() {
    try {
      PaymentReff.add({
        "RECEPT NO:": _receptNo.text,
        "STOCK PRICE": _stockPrice.text,
        "PAYMENT": _payment.text,
        "BALANCE": _balace.text,
        "QANTITY": quantity.text,
         "PRODUCT": _payproducts.toString(),
        "COMPANY": _paycompany_name.toString(),
         "QUATAR": _payquarter.toString(),
        "DATE": Todaydate()
      }).whenComplete(() {
        setState((){
          isLoadingPayment=false;
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage()));
        });
      });
    } on PlatformException catch (e) {
      String Err=e.toString();
      myToast(Err);
      Text(Err);
    } catch (e) {
      String Err=e.toString();
      myToast(Err);
    }

  }

  bool isLoadingPayment = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PAYMENT"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Divider(
            height: 90,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'COMPANY',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ),

            ],
          ),
          Form(
              key: _globalKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'PRODUCT',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Container(
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
                    ],
                  ),
                  //==RECEPT NO========
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(

                      keyboardType: TextInputType.number,
                      controller:_receptNo,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter receipt no';
                        }
                        return null;
                      },
                      decoration: InputDecoration(

                          labelText: 'Receipt no',
                          prefixText:"RECEIP NO:    " ,
                          prefixStyle: TextStyle(color: Colors.black),
                          hintText: 'Receipt ',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 23.0, color: Colors.black))),
                    ),
                  ),
                  //===STOCKPR
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(

                      keyboardType: TextInputType.number,
                      controller:_stockPrice,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Stock price';
                        }
                        return null;
                      },
                      decoration: InputDecoration(

                          labelText: 'Stock price',
                          prefixText:"STOCK PRICE:    " ,
                          prefixStyle: TextStyle(color: Colors.black),
                          hintText: 'Stock price',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 23.0, color: Colors.black))),
                    ),
                  ),
                  //Payment
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(

                      keyboardType: TextInputType.number,
                      controller:_payment,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter payment';
                        }
                        return null;
                      },
                      decoration: InputDecoration(

                          labelText: 'Payment',
                          prefixText:"PAYMENT:    " ,
                          prefixStyle: TextStyle(color: Colors.black),
                          hintText: 'Enter payment',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 23.0, color: Colors.black))),
                    ),
                  ),
                  //==Balace
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextFormField(

                      keyboardType: TextInputType.number,
                      controller:_balace,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter balance';
                        }
                        return null;
                      },
                      decoration: InputDecoration(

                          labelText: 'Balance',
                          prefixText:"BALANCE:    " ,
                          prefixStyle: TextStyle(color: Colors.black),
                          hintText: 'Enter Balance',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 23.0, color: Colors.black))),
                    ),
                  ),
                  //PRice
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(

                      keyboardType: TextInputType.number,
                      controller:quantity,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter price';
                        }
                        return null;
                      },
                      decoration: InputDecoration(

                          labelText: 'quatity',
                          prefixText:"QUANTITY:    " ,
                          prefixStyle: TextStyle(color: Colors.black),
                          hintText: 'Enter quatity',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 23.0, color: Colors.black))),
                    ),
                  ),
                  //Quater
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'QUARTER',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
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
                            value: _payquarter,
                            onChanged: (value) {
                              setState(() {
                                _payquarter = value.toString();
                              });
                            },
                            items: _payquarterList.map((itemone) {
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
                      ],
                    ),
                  ),
                  Divider(),
   //   ==============buttons
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        // clear button
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage()));
                            }, child: Text('Clear')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: isLoadingPayment
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () {

                                  if (_globalKey.currentState!.validate() && _payproducts!='Select product' && _paycompany_name!='Select company' && _payquarter!='Select quarter') {
                                    setState(() {
                                      isLoadingPayment = true;
                                    });
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PaymentPage()));
                                    AddPayment();
                                  } else {
                                    return snackbar( context,'Make sureselect:-\n\ Company name \n\ Product \n\ Quater.'
                                    );
                                  }
                                },
                                child: Text(
                                  'Save',
                                )),
                      ),

                    ],
                  ),
                ],
              )),

          // Quatar
        ],
      ),
    );
  }
}
