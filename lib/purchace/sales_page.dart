
import 'package:flutter/material.dart';
import 'package:purchase/purchace/purchase_home.dart';

double  DeleteTotal=0;
double  Gtotal=0;
class MylistDynamics extends StatefulWidget {
  const MylistDynamics({Key? key}) : super(key: key);

  @override
  State<MylistDynamics> createState() => _MylistDynamicsState();
}

class _MylistDynamicsState extends State<MylistDynamics> {

    List<double>GtotalList=[];
    double Sum=0;
  String _paycompany_name = 'Select company';
  List<String> _paycompanyList = [
    'Select company', 'WE 2 CO LTD', 'AFRICA FISH CO', 'DOLFEN FRONZEN', 'NORTH SOUTH', 'OCEAN FARE', 'MR YEBOAH', 'MARANATHA', 'KUMASI DOMFE'
  ];
  List <DynamicWidget >ListDynamic=[];



  addDynamic(){
    setState((){
      ListDynamic.add(DynamicWidget());
    });
    
  }
  DeleteData(){
    setState((){
      ListDynamic.removeLast();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         title: Text('PAYMENT',style: TextStyle(
           fontSize: 15.0,
           color: Colors.white,
           fontWeight: FontWeight.bold
         ),),
          actions: [
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

          ],
        ),



        body: Container(

          child:Column(
            children: <Widget>[
               Row(
                 children: [
                   Text('     PRODUCT  ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                   Text('             QNTY  ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                   Text('PRICE      ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                   Text('TOTAL',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),

                 ],
               ),
              Flexible(child: ListView.builder(


                itemCount:ListDynamic.length,
                  itemBuilder: (_,index)=>ListDynamic[index])),
             // addDynamic(),
Container(
  width:MediaQuery.of(context).size.width,
  height: 70,
  child: Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: FloatingActionButton(onPressed: (){DeleteData();
            DeleteTotal;
            },
            child: Icon(Icons.delete,color: Colors.red,size: 40.0,),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 220),
        child: FloatingActionButton(
          onPressed:(){
            addDynamic();
            },
          child: Icon(Icons.add,color: Colors.white, size: 50,),

        ),
      ),
    ],
  ),
),



              Container(
                width: MediaQuery.of(context).size.width,
                height:200,
                decoration: BoxDecoration(

                  color: Colors.black12,
                  border: Border.all(width: 6),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('TOTAL      ',style: TextStyle(fontWeight: FontWeight.bold),),
                              Container(
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Row(
                                  // To display Gtoal
                                  //////////////////////////////////////////////////////////////////////////////////////////
                                  children: [Text('GH¢'+"${Gtotal}")],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('PAYMENT',style: TextStyle(fontWeight: FontWeight.bold),),
                              Container(
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: TextField()
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('BALANCE',style: TextStyle(fontWeight: FontWeight.bold),),
                              Container(
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Row(
                                  children: [Text('GH¢')],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('WAYBILL  ',style: TextStyle(fontWeight: FontWeight.bold),),
                              Container(
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: TextField(

                                )
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: ElevatedButton(onPressed: null, child:Text('SAVE')),
                    )
                  ],
                ),
              )
            ],

          )

        ));
  }
}
class DynamicWidget extends StatefulWidget {


   DynamicWidget({Key? key,}) : super(key: key);

  @override
  State<DynamicWidget> createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  String _payproducts = 'Select product';
  List<String> _payproductList = [
    'Select product', 'MK 20+ 20Kg', 'MK 25+ 20Kg', 'MK 16+ 20Kg', 'MK 10Kg DS', 'HM 16+ 20Kg', 'HM 25+ 20Kg', 'HM 20+ 20Kg', 'HM 25+ 30Kg', 'MK 20+ 30Kg', 'HM 16+ 30Kg', 'HM 14+ 20Kg', 'HM 14+ 30Kg', 'HM 12+ 20Kg', 'HM 12+ 30Kg', 'HM 10+ 20Kg', 'HM 10+ 30Kg', '2BRO 20Kg', '2BRO 30K', 'SARDINE 20Kg', 'SARDINE 30Kg', 'AMANE 20g', 'AMANE 30Kg', 'BONITO 20Kg', 'BONITO 30Kg', 'LIALIA 20Kg', 'LIALIA 27Kg', 'BRAMA 20Kg', 'BRAMA 27Kg', 'MACHEL 15Kg', 'HM 10Kg', 'HM 15Kg', 'CUTLASS FISH 20Kg', 'CUTLASS FISH 30Kg', 'STOMA 20Kg', 'HAKE 10Kg', 'HAKE 20Kg', 'HAKE 30Kg',
    'HAKE SMALL SIZES', '25 FLAT', 'REDFISH BOX', 'REDFISH 10Kg', 'TUNA 10Kg', 'TUNA 20Kg', 'TUNA 27Kg', 'PAGO 4P', 'PAGO P', 'DENTEX LONG', 'SPRATE 20Kg', 'OPAA 10Kg', 'OPAA 20Kg', 'CK BACK', 'CK LAYER', 'CK HOLLAND', 'CK BRAZIL', 'CK FULL', 'CK SAUSAGE', 'BEEF SAUSAGE', 'US DRUM STICKS', 'HOLLAND DRUM STICKS', 'US MANTRE', 'CK WINGS', 'TURKY WINGS', 'NTITIN', 'TRIPEX', 'OTHER',
  ];
   TextEditingController _price =TextEditingController();
   TextEditingController _qnty =TextEditingController();
   TextEditingController _total =TextEditingController();

  double _totalValue=0;
  double _priceValue=0;
  double _qntyValue=0;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [

              Container(


                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                // color: Colors.white,
                // height: 40,
                // width: 70.0,
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
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ));
                  }).toList(),
                ),
              ),
            ],
          ),
          Column(
            children: [

              Container(
                  decoration: BoxDecoration(
                      border: Border.all()

                  ),
                  height: 30.0,
                  width: 50.0,
                  child: TextField(
                    controller: _qnty,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize:10
                    ),
                    onChanged: (value){
                      setState((){
                        if(value.isEmpty){
                          _qntyValue=0;
                          _totalValue=0;
                          Gtotal=0;
                        }else{
                          _qntyValue = double.parse(value);
                          _totalValue=_qntyValue * _priceValue;
                          Gtotal=Gtotal+_totalValue;
                        }

                      });
                    },


                  ))

            ],
          ),
          Column(
            children: [

              Container(
                  decoration: BoxDecoration(
                      border: Border.all()

                  ),
                  height: 30.0,
                  width: 70.0,
                  child: TextField(
                    controller: _price
                    ,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize:10
                    ),
                    onChanged: (value){
                      setState((){
                        if(value.isEmpty){
                          _priceValue=0;
                          _totalValue=0;
                          Gtotal=0;
                        }else{
                          _priceValue = double.parse(value);
                          _totalValue=_qntyValue * _priceValue;
                          Gtotal=Gtotal+_totalValue;
                          DeleteTotal=Gtotal-_totalValue;


                        }
                      });
                    },


                  ))

            ],
          ),
          Column(
            children: [

              Container(
                  decoration: BoxDecoration(
                      border: Border.all()

                  ),
                  height: 30.0,
                  width: 80.0,
                  child: Text("${_totalValue}"))

            ],
          ),


        ],
      ),
    );

  }
}

