import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchase/purchace/classes/date_class.dart';
import 'package:purchase/purchace/payment.dart';

class purchasePage extends StatefulWidget {
  const purchasePage({Key? key}) : super(key: key);

  @override
  State<purchasePage> createState() => _purchasePageState();
}

class _purchasePageState extends State<purchasePage> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
 double Qnty1=0;
 double Qnty2=0;
 double Qnty3=0;
 double Qnty4=0;
 double Qnty5=0;
 double Qnty6=0;
 double Qnty7=0;
 double Qnty8=0;
 double Qnty9=0;
 double Qnty10=0;


  double Price1=0;
  double Price2=0;
  double Price3=0;
  double Price4=0;
  double Price5=0;
  double Price6=0;
  double Price7=0;
  double Price8=0;
  double Price9=0;
  double Price10=0;


  double Total1=0;
  double Total2=0;
  double Total3=0;
  double Total4=0;
  double Total5=0;
  double Total6=0;
  double Total7=0;
  double Total8=0;
  double Total9=0;
  double Total10=0;

  double GoundTotal=0;
  double Payment=0;
  double Balance=0;






  String _payproducts = 'Select product';
  List<String> _payproductList = [
    'Select product', 'MK 20+ 20Kg', 'MK 25+ 20Kg', 'MK 16+ 20Kg', 'MK 10Kg DS', 'HM 16+ 20Kg', 'HM 25+ 20Kg', 'HM 20+ 20Kg', 'HM 25+ 30Kg', 'MK 20+ 30Kg', 'HM 16+ 30Kg', 'HM 14+ 20Kg', 'HM 14+ 30Kg', 'HM 12+ 20Kg', 'HM 12+ 30Kg', 'HM 10+ 20Kg', 'HM 10+ 30Kg', '2BRO 20Kg', '2BRO 30K', 'SARDINE 20Kg', 'SARDINE 30Kg', 'AMANE 20g', 'AMANE 30Kg', 'BONITO 20Kg', 'BONITO 30Kg', 'LIALIA 20Kg', 'LIALIA 27Kg', 'BRAMA 20Kg', 'BRAMA 27Kg', 'MACHEL 15Kg', 'HM 10Kg', 'HM 15Kg', 'CUTLASS FISH 20Kg', 'CUTLASS FISH 30Kg', 'STOMA 20Kg', 'HAKE 10Kg', 'HAKE 20Kg', 'HAKE 30Kg',
    'HAKE SMALL SIZES', '25 FLAT', 'REDFISH BOX', 'REDFISH 10Kg', 'TUNA 10Kg', 'TUNA 20Kg', 'TUNA 27Kg', 'PAGO 4P', 'PAGO P', 'DENTEX LONG', 'SPRATE 20Kg', 'OPAA 10Kg', 'OPAA 20Kg', 'CK BACK', 'CK LAYER', 'CK HOLLAND', 'CK BRAZIL', 'CK FULL', 'CK SAUSAGE', 'BEEF SAUSAGE', 'US DRUM STICKS', 'HOLLAND DRUM STICKS', 'US MANTRE', 'CK WINGS', 'TURKY WINGS', 'NTITIN', 'TRIPEX', 'OTHER',
  ];
  //widget 2
  String _payproducts2 = 'Select product';
  List<String> _payproductList2 = [
    'Select product', 'MK 20+ 20Kg', 'MK 25+ 20Kg', 'MK 16+ 20Kg', 'MK 10Kg DS', 'HM 16+ 20Kg', 'HM 25+ 20Kg', 'HM 20+ 20Kg', 'HM 25+ 30Kg', 'MK 20+ 30Kg', 'HM 16+ 30Kg', 'HM 14+ 20Kg', 'HM 14+ 30Kg', 'HM 12+ 20Kg', 'HM 12+ 30Kg', 'HM 10+ 20Kg',
    'HM 10+ 30Kg', '2BRO 20Kg', '2BRO 30K', 'SARDINE 20Kg', 'SARDINE 30Kg', 'AMANE 20g', 'AMANE 30Kg', 'BONITO 20Kg', 'BONITO 30Kg', 'LIALIA 20Kg', 'LIALIA 27Kg', 'BRAMA 20Kg', 'BRAMA 27Kg', 'MACHEL 15Kg', 'HM 10Kg', 'HM 15Kg', 'CUTLASS FISH 20Kg', 'CUTLASS FISH 30Kg', 'STOMA 20Kg', 'HAKE 10Kg', 'HAKE 20Kg', 'HAKE 30Kg', 'HAKE SMALL SIZES', '25 FLAT', 'REDFISH BOX', 'REDFISH 10Kg', 'TUNA 10Kg', 'TUNA 20Kg', 'TUNA 27Kg', 'PAGO 4P', 'PAGO P', 'DENTEX LONG', 'SPRATE 20Kg', 'OPAA 10Kg', 'OPAA 20Kg', 'CK BACK', 'CK LAYER', 'CK HOLLAND', 'CK BRAZIL', 'CK FULL', 'CK SAUSAGE', 'BEEF SAUSAGE', 'US DRUM STICKS', 'HOLLAND DRUM STICKS', 'US MANTRE', 'CK WINGS', 'TURKY WINGS', 'NTITIN', 'TRIPEX', 'OTHER',
  ];
  //widget 3
  String _payproducts3 = 'Select product';
  List<String> _payproductList3 = [
    'Select product', 'MK 20+ 20Kg', 'MK 25+ 20Kg', 'MK 16+ 20Kg', 'MK 10Kg DS', 'HM 16+ 20Kg', 'HM 25+ 20Kg', 'HM 20+ 20Kg', 'HM 25+ 30Kg', 'MK 20+ 30Kg', 'HM 16+ 30Kg', 'HM 14+ 20Kg', 'HM 14+ 30Kg', 'HM 12+ 20Kg', 'HM 12+ 30Kg', 'HM 10+ 20Kg', 'HM 10+ 30Kg', '2BRO 20Kg', '2BRO 30K', 'SARDINE 20Kg', 'SARDINE 30Kg', 'AMANE 20g', 'AMANE 30Kg', 'BONITO 20Kg', 'BONITO 30Kg', 'LIALIA 20Kg', 'LIALIA 27Kg', 'BRAMA 20Kg', 'BRAMA 27Kg', 'MACHEL 15Kg', 'HM 10Kg', 'HM 15Kg', 'CUTLASS FISH 20Kg', 'CUTLASS FISH 30Kg', 'STOMA 20Kg', 'HAKE 10Kg', 'HAKE 20Kg', 'HAKE 30Kg',
    'HAKE SMALL SIZES', '25 FLAT', 'REDFISH BOX', 'REDFISH 10Kg', 'TUNA 10Kg', 'TUNA 20Kg', 'TUNA 27Kg', 'PAGO 4P', 'PAGO P', 'DENTEX LONG', 'SPRATE 20Kg', 'OPAA 10Kg', 'OPAA 20Kg', 'CK BACK', 'CK LAYER', 'CK HOLLAND', 'CK BRAZIL', 'CK FULL', 'CK SAUSAGE', 'BEEF SAUSAGE', 'US DRUM STICKS', 'HOLLAND DRUM STICKS', 'US MANTRE', 'CK WINGS', 'TURKY WINGS', 'NTITIN', 'TRIPEX', 'OTHER',
  ];
  //widget 4
  String _payproducts4 = 'Select product';
  List<String> _payproductList4 = [
    'Select product', 'MK 20+ 20Kg', 'MK 25+ 20Kg', 'MK 16+ 20Kg', 'MK 10Kg DS', 'HM 16+ 20Kg', 'HM 25+ 20Kg', 'HM 20+ 20Kg', 'HM 25+ 30Kg', 'MK 20+ 30Kg', 'HM 16+ 30Kg', 'HM 14+ 20Kg', 'HM 14+ 30Kg', 'HM 12+ 20Kg', 'HM 12+ 30Kg', 'HM 10+ 20Kg', 'HM 10+ 30Kg', '2BRO 20Kg', '2BRO 30K', 'SARDINE 20Kg', 'SARDINE 30Kg', 'AMANE 20g', 'AMANE 30Kg', 'BONITO 20Kg', 'BONITO 30Kg', 'LIALIA 20Kg', 'LIALIA 27Kg', 'BRAMA 20Kg', 'BRAMA 27Kg', 'MACHEL 15Kg', 'HM 10Kg', 'HM 15Kg', 'CUTLASS FISH 20Kg', 'CUTLASS FISH 30Kg', 'STOMA 20Kg', 'HAKE 10Kg', 'HAKE 20Kg', 'HAKE 30Kg',
    'HAKE SMALL SIZES', '25 FLAT', 'REDFISH BOX', 'REDFISH 10Kg', 'TUNA 10Kg', 'TUNA 20Kg', 'TUNA 27Kg', 'PAGO 4P', 'PAGO P', 'DENTEX LONG', 'SPRATE 20Kg', 'OPAA 10Kg', 'OPAA 20Kg', 'CK BACK', 'CK LAYER', 'CK HOLLAND', 'CK BRAZIL', 'CK FULL', 'CK SAUSAGE', 'BEEF SAUSAGE', 'US DRUM STICKS', 'HOLLAND DRUM STICKS', 'US MANTRE', 'CK WINGS', 'TURKY WINGS', 'NTITIN', 'TRIPEX', 'OTHER',
  ];
  //widget 5
  String _payproducts5 = 'Select product';
  List<String> _payproductList5 = [
    'Select product', 'MK 20+ 20Kg', 'MK 25+ 20Kg', 'MK 16+ 20Kg', 'MK 10Kg DS', 'HM 16+ 20Kg', 'HM 25+ 20Kg', 'HM 20+ 20Kg', 'HM 25+ 30Kg', 'MK 20+ 30Kg', 'HM 16+ 30Kg', 'HM 14+ 20Kg', 'HM 14+ 30Kg', 'HM 12+ 20Kg', 'HM 12+ 30Kg', 'HM 10+ 20Kg', 'HM 10+ 30Kg', '2BRO 20Kg', '2BRO 30K', 'SARDINE 20Kg', 'SARDINE 30Kg', 'AMANE 20g', 'AMANE 30Kg', 'BONITO 20Kg', 'BONITO 30Kg', 'LIALIA 20Kg', 'LIALIA 27Kg', 'BRAMA 20Kg', 'BRAMA 27Kg', 'MACHEL 15Kg', 'HM 10Kg', 'HM 15Kg', 'CUTLASS FISH 20Kg', 'CUTLASS FISH 30Kg', 'STOMA 20Kg', 'HAKE 10Kg', 'HAKE 20Kg', 'HAKE 30Kg',
    'HAKE SMALL SIZES', '25 FLAT', 'REDFISH BOX', 'REDFISH 10Kg', 'TUNA 10Kg', 'TUNA 20Kg', 'TUNA 27Kg', 'PAGO 4P', 'PAGO P', 'DENTEX LONG', 'SPRATE 20Kg', 'OPAA 10Kg', 'OPAA 20Kg', 'CK BACK', 'CK LAYER', 'CK HOLLAND', 'CK BRAZIL', 'CK FULL', 'CK SAUSAGE', 'BEEF SAUSAGE', 'US DRUM STICKS', 'HOLLAND DRUM STICKS', 'US MANTRE', 'CK WINGS', 'TURKY WINGS', 'NTITIN', 'TRIPEX', 'OTHER',
  ];
  //widget 6
  String _payproducts6 = 'Select product';
  List<String> _payproductList6 = [
    'Select product', 'MK 20+ 20Kg', 'MK 25+ 20Kg', 'MK 16+ 20Kg', 'MK 10Kg DS', 'HM 16+ 20Kg', 'HM 25+ 20Kg', 'HM 20+ 20Kg', 'HM 25+ 30Kg', 'MK 20+ 30Kg', 'HM 16+ 30Kg', 'HM 14+ 20Kg', 'HM 14+ 30Kg', 'HM 12+ 20Kg', 'HM 12+ 30Kg', 'HM 10+ 20Kg', 'HM 10+ 30Kg', '2BRO 20Kg', '2BRO 30K', 'SARDINE 20Kg', 'SARDINE 30Kg', 'AMANE 20g', 'AMANE 30Kg', 'BONITO 20Kg', 'BONITO 30Kg', 'LIALIA 20Kg', 'LIALIA 27Kg', 'BRAMA 20Kg', 'BRAMA 27Kg', 'MACHEL 15Kg', 'HM 10Kg', 'HM 15Kg', 'CUTLASS FISH 20Kg', 'CUTLASS FISH 30Kg', 'STOMA 20Kg', 'HAKE 10Kg', 'HAKE 20Kg', 'HAKE 30Kg',
    'HAKE SMALL SIZES', '25 FLAT', 'REDFISH BOX', 'REDFISH 10Kg', 'TUNA 10Kg', 'TUNA 20Kg', 'TUNA 27Kg', 'PAGO 4P', 'PAGO P', 'DENTEX LONG', 'SPRATE 20Kg', 'OPAA 10Kg', 'OPAA 20Kg', 'CK BACK', 'CK LAYER', 'CK HOLLAND', 'CK BRAZIL', 'CK FULL', 'CK SAUSAGE', 'BEEF SAUSAGE', 'US DRUM STICKS', 'HOLLAND DRUM STICKS', 'US MANTRE', 'CK WINGS', 'TURKY WINGS', 'NTITIN', 'TRIPEX', 'OTHER',
  ];
  //widget 7
  String _payproducts7 = 'Select product';
  List<String> _payproductList7 = [
    'Select product', 'MK 20+ 20Kg', 'MK 25+ 20Kg', 'MK 16+ 20Kg', 'MK 10Kg DS', 'HM 16+ 20Kg', 'HM 25+ 20Kg', 'HM 20+ 20Kg', 'HM 25+ 30Kg', 'MK 20+ 30Kg', 'HM 16+ 30Kg', 'HM 14+ 20Kg', 'HM 14+ 30Kg', 'HM 12+ 20Kg', 'HM 12+ 30Kg', 'HM 10+ 20Kg', 'HM 10+ 30Kg', '2BRO 20Kg', '2BRO 30K', 'SARDINE 20Kg', 'SARDINE 30Kg', 'AMANE 20g', 'AMANE 30Kg', 'BONITO 20Kg', 'BONITO 30Kg', 'LIALIA 20Kg', 'LIALIA 27Kg', 'BRAMA 20Kg', 'BRAMA 27Kg', 'MACHEL 15Kg', 'HM 10Kg', 'HM 15Kg', 'CUTLASS FISH 20Kg', 'CUTLASS FISH 30Kg', 'STOMA 20Kg', 'HAKE 10Kg', 'HAKE 20Kg', 'HAKE 30Kg',
    'HAKE SMALL SIZES', '25 FLAT', 'REDFISH BOX', 'REDFISH 10Kg', 'TUNA 10Kg', 'TUNA 20Kg', 'TUNA 27Kg', 'PAGO 4P', 'PAGO P', 'DENTEX LONG', 'SPRATE 20Kg', 'OPAA 10Kg', 'OPAA 20Kg', 'CK BACK', 'CK LAYER', 'CK HOLLAND', 'CK BRAZIL', 'CK FULL', 'CK SAUSAGE', 'BEEF SAUSAGE', 'US DRUM STICKS', 'HOLLAND DRUM STICKS', 'US MANTRE', 'CK WINGS', 'TURKY WINGS', 'NTITIN', 'TRIPEX', 'OTHER',
  ];
  //widget 8
  String _payproducts8 = 'Select product';
  List<String> _payproductList8 = [
    'Select product', 'MK 20+ 20Kg', 'MK 25+ 20Kg', 'MK 16+ 20Kg', 'MK 10Kg DS', 'HM 16+ 20Kg', 'HM 25+ 20Kg', 'HM 20+ 20Kg', 'HM 25+ 30Kg', 'MK 20+ 30Kg', 'HM 16+ 30Kg', 'HM 14+ 20Kg', 'HM 14+ 30Kg', 'HM 12+ 20Kg', 'HM 12+ 30Kg', 'HM 10+ 20Kg', 'HM 10+ 30Kg', '2BRO 20Kg', '2BRO 30K', 'SARDINE 20Kg', 'SARDINE 30Kg', 'AMANE 20g', 'AMANE 30Kg', 'BONITO 20Kg', 'BONITO 30Kg', 'LIALIA 20Kg', 'LIALIA 27Kg', 'BRAMA 20Kg', 'BRAMA 27Kg', 'MACHEL 15Kg', 'HM 10Kg', 'HM 15Kg', 'CUTLASS FISH 20Kg', 'CUTLASS FISH 30Kg', 'STOMA 20Kg', 'HAKE 10Kg', 'HAKE 20Kg', 'HAKE 30Kg',
    'HAKE SMALL SIZES', '25 FLAT', 'REDFISH BOX', 'REDFISH 10Kg', 'TUNA 10Kg', 'TUNA 20Kg', 'TUNA 27Kg', 'PAGO 4P', 'PAGO P', 'DENTEX LONG', 'SPRATE 20Kg', 'OPAA 10Kg', 'OPAA 20Kg', 'CK BACK', 'CK LAYER', 'CK HOLLAND', 'CK BRAZIL', 'CK FULL', 'CK SAUSAGE', 'BEEF SAUSAGE', 'US DRUM STICKS', 'HOLLAND DRUM STICKS', 'US MANTRE', 'CK WINGS', 'TURKY WINGS', 'NTITIN', 'TRIPEX', 'OTHER',
  ];
  //widget 9
  String _payproducts9= 'Select product';
  List<String> _payproductList9 = [
    'Select product', 'MK 20+ 20Kg', 'MK 25+ 20Kg', 'MK 16+ 20Kg', 'MK 10Kg DS', 'HM 16+ 20Kg', 'HM 25+ 20Kg', 'HM 20+ 20Kg', 'HM 25+ 30Kg', 'MK 20+ 30Kg', 'HM 16+ 30Kg', 'HM 14+ 20Kg', 'HM 14+ 30Kg', 'HM 12+ 20Kg', 'HM 12+ 30Kg', 'HM 10+ 20Kg', 'HM 10+ 30Kg', '2BRO 20Kg', '2BRO 30K', 'SARDINE 20Kg', 'SARDINE 30Kg', 'AMANE 20g', 'AMANE 30Kg', 'BONITO 20Kg', 'BONITO 30Kg', 'LIALIA 20Kg', 'LIALIA 27Kg', 'BRAMA 20Kg', 'BRAMA 27Kg', 'MACHEL 15Kg', 'HM 10Kg', 'HM 15Kg', 'CUTLASS FISH 20Kg', 'CUTLASS FISH 30Kg', 'STOMA 20Kg', 'HAKE 10Kg', 'HAKE 20Kg', 'HAKE 30Kg',
    'HAKE SMALL SIZES', '25 FLAT', 'REDFISH BOX', 'REDFISH 10Kg', 'TUNA 10Kg', 'TUNA 20Kg', 'TUNA 27Kg', 'PAGO 4P', 'PAGO P', 'DENTEX LONG', 'SPRATE 20Kg', 'OPAA 10Kg', 'OPAA 20Kg', 'CK BACK', 'CK LAYER', 'CK HOLLAND', 'CK BRAZIL', 'CK FULL', 'CK SAUSAGE', 'BEEF SAUSAGE', 'US DRUM STICKS', 'HOLLAND DRUM STICKS', 'US MANTRE', 'CK WINGS', 'TURKY WINGS', 'NTITIN', 'TRIPEX', 'OTHER',
  ];
  //widget 10
  String _payproducts10 = 'Select product';
  List<String> _payproductList10 = [
    'Select product', 'MK 20+ 20Kg', 'MK 25+ 20Kg', 'MK 16+ 20Kg', 'MK 10Kg DS', 'HM 16+ 20Kg', 'HM 25+ 20Kg', 'HM 20+ 20Kg', 'HM 25+ 30Kg', 'MK 20+ 30Kg', 'HM 16+ 30Kg', 'HM 14+ 20Kg', 'HM 14+ 30Kg', 'HM 12+ 20Kg', 'HM 12+ 30Kg', 'HM 10+ 20Kg', 'HM 10+ 30Kg', '2BRO 20Kg', '2BRO 30K', 'SARDINE 20Kg', 'SARDINE 30Kg', 'AMANE 20g', 'AMANE 30Kg', 'BONITO 20Kg', 'BONITO 30Kg', 'LIALIA 20Kg', 'LIALIA 27Kg', 'BRAMA 20Kg', 'BRAMA 27Kg', 'MACHEL 15Kg', 'HM 10Kg', 'HM 15Kg', 'CUTLASS FISH 20Kg', 'CUTLASS FISH 30Kg', 'STOMA 20Kg', 'HAKE 10Kg', 'HAKE 20Kg', 'HAKE 30Kg',
    'HAKE SMALL SIZES', '25 FLAT', 'REDFISH BOX', 'REDFISH 10Kg', 'TUNA 10Kg', 'TUNA 20Kg', 'TUNA 27Kg', 'PAGO 4P', 'PAGO P', 'DENTEX LONG', 'SPRATE 20Kg', 'OPAA 10Kg', 'OPAA 20Kg', 'CK BACK', 'CK LAYER', 'CK HOLLAND', 'CK BRAZIL', 'CK FULL', 'CK SAUSAGE', 'BEEF SAUSAGE', 'US DRUM STICKS', 'HOLLAND DRUM STICKS', 'US MANTRE', 'CK WINGS', 'TURKY WINGS', 'NTITIN', 'TRIPEX', 'OTHER',
  ];






  // select company from dropdown
  String _paycompany_name = 'Select company';
  List<String> _paycompanyList = [
    'Select company', 'WE 2 CO LTD', 'AFRICA FISH CO', 'DOLFEN FRONZEN', 'NORTH SOUTH', 'OCEAN FARE', 'MR YEBOAH', 'MARANATHA', 'KUMASI DOMFE'
  ];

  // Quatar
  String _payquarter = 'Select quarter';
  List<String> _payquarterList = ['Select quarter', '1', '2', '3', '4'];

  TextEditingController Waybill = TextEditingController();
  TextEditingController _conQnty1 = TextEditingController();
  TextEditingController _conQnty2 = TextEditingController();
  TextEditingController _conQnty3 = TextEditingController();
  TextEditingController _conQnty4 = TextEditingController();
  TextEditingController _conQnty5= TextEditingController();
  TextEditingController _conQnty6 = TextEditingController();
  TextEditingController _conQnty7 = TextEditingController();
  TextEditingController _conQnty8 = TextEditingController();
  TextEditingController _conQnty9 = TextEditingController();
  TextEditingController _conQnty10 = TextEditingController();
  TextEditingController _conPrice1 = TextEditingController();
  TextEditingController _conPrice2 = TextEditingController();
  TextEditingController _conPrice3 = TextEditingController();
  TextEditingController _conPrice4 = TextEditingController();
  TextEditingController _conPrice5 = TextEditingController();
  TextEditingController _conPrice6 = TextEditingController();
  TextEditingController _conPrice7 = TextEditingController();
  TextEditingController _conPrice8 = TextEditingController();
  TextEditingController _conPrice9 = TextEditingController();
  TextEditingController _conPrice10 = TextEditingController();
  TextEditingController _balace = TextEditingController();
  TextEditingController _price = TextEditingController();
  final PaymentReff = FirebaseFirestore.instance.collection('Payment');

  AddPayment() {
    try {
      PaymentReff.add({
        "product name":_payproducts.toString(),
        "Q1":_conQnty1.text,
        "p1":_conPrice1.text,
        "t1":Total1.toString(),
        "product name2":_payproducts2.toString(),
        "Q2":_conQnty2.text,
        "p2":_conPrice2.text,
        "t2":Total2.toString(),

        "product name3":_payproducts3.toString(),
        "Q3":_conQnty3.text,
        "p3":_conPrice3.text,
        "t3":Total3.toString(),

        "product name4":_payproducts4.toString(),
        "Q4":_conQnty4.text,
        "p4":_conPrice4.text,
        "t4":Total4.toString(),



        "product name5":_payproducts5.toString(),
        "Q5":_conQnty5.text,
        "p5":_conPrice5.text,
        "t5":Total5.toString(),

        "product name6":_payproducts6.toString(),
        "Q6":_conQnty6.text,
        "p6":_conPrice6.text,
        "t6":Total6.toString(),


        "product name7":_payproducts7.toString(),
        "Q7":_conQnty7.text,
        "p7":_conPrice7.text,
        "t7":Total7.toString(),

        "product name8":_payproducts8.toString(),
        "Q8":_conQnty8.text,
        "p8":_conPrice8.text,
        "t8":Total8.toString(),

        "product name9":_payproducts9.toString(),
        "Q9":_conQnty9.text,
        "p9":_conPrice9.text,
        "t9":Total9.toString(),

        "product name10":_payproducts10.toString(),
        "Q10":_conQnty10.text,
        "p10":_conPrice10.text,
        "t10":Total10.toString(),

        "Gtotal": GoundTotal.toString(),
        "Balance": Balance.toString(),
        "Payment": Payment.toString(),








        "COMPANY": _paycompany_name.toString(),

        "DATE": Todaydate()
      }).whenComplete(() {
        setState((){
          isLoadingPayment=false;
          Navigator.push(context, MaterialPageRoute(builder: (context)=>purchasePage()));
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
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool isLoadingPayment = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: Stack(
         children: [
           Container(
             width: MediaQuery.of(context).size.width,
             height: 50.0,
             decoration: BoxDecoration(
               border: Border.all(),
               color: Colors.black12,
               borderRadius: BorderRadius.all(Radius.circular(5.0))
             ),
             child: Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left:30),
                   child: ElevatedButton(onPressed: (){
                     _conQnty1.clear();
                     _conQnty2.clear();
                     _conQnty3.clear();
                     _conQnty4.clear();
                     _conQnty5.clear();
                     _conQnty6.clear();
                     _conQnty7.clear();
                     _conQnty8.clear();
                     _conQnty9.clear();
                     _conQnty10.clear();
                     _conPrice1.clear();
                     _conPrice2.clear();
                     _conPrice3.clear();
                     _conPrice4.clear();
                     _conPrice5.clear();
                     _conPrice6.clear();
                     _conPrice7.clear();
                     _conPrice8.clear();
                     _conPrice9.clear();
                     _conPrice10.clear();
                     Waybill.clear();
                     setState((){
                       Total1=0;
                       Total2=0;
                       Total3=0;
                       Total4=0;
                       Total5=0;
                       Total6=0;
                       Total7=0;
                       Total8=0;
                       Total9=0;
                       Total10=0;
                       GoundTotal=0;
                       Balance=0;




                     });
                   }, child: Text("CLEAR")),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 150),
                   child: ElevatedButton(
                       onPressed: (){

                         AddPayment();

                       }, child: isLoadingPayment?CircularProgressIndicator():Text('SAVE',style: TextStyle(
                     color: Colors.black,fontWeight: FontWeight.bold
                   ),)),
                 )
               ],
             ),
           ),

        ],

       ),
      appBar: AppBar(

        title: Text("PURCHASE",style: TextStyle(
            color: Colors.white
        ),),
        centerTitle: true,
      ),

      body: ListView(
        children: [
         
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
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ));
                  }).toList(),
                ),

              ),

            ],

          ),

          Column(
            children: [
              // 1st widget
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          'PRODUCT 1',
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'QNTY',
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all()

                          ),
                          height: 30.0,
                          width: 50.0,
                          child: TextField(
                            controller: _conQnty1,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Qnty1=0;
                                  Total1=0;
                                }else{
                                  Qnty1 = double.parse(value);
                                  Total1=Qnty1*Price1;
                                }
                                  setState((){
                                    GoundTotal=Total1;
                                  });
                              });
                            },


                          ))

                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'PRICE',
                          style: TextStyle(fontSize: 9.0),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all()

                          ),
                          height: 30.0,
                          width: 70.0,
                          child: TextField(
                           controller: _conPrice1,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Price1=0;
                                  Total1=0;
                                }else{
                                  Price1 = double.parse(value);
                                  Total1=Qnty1*Price1;
                                  setState((){

                                  });

                                }

                              });
                            },


                          ))

                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'TOTAL',
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all()

                          ),
                          height: 30.0,
                          width: 80.0,
                          child: InkWell(

                            child: Text("${Total1}")
                          ))

                    ],
                  ),


                ],
              ),

              // 2nd widget
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          'PRODUCT 2',
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ),
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
                          value: _payproducts2,
                          onChanged: (value) {
                            setState(() {
                              _payproducts2 = value.toString();
                            });
                          },
                          items: _payproductList2.map((itemone) {
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
                             controller: _conQnty2,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Qnty2=0;
                                  Total2=0;
                                }else{
                                  Qnty2 = double.parse(value);
                                  Total2=Qnty2 * Price2;

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
                             controller: _conPrice2,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Price2=0;
                                  Total2=0;
                                }else{
                                  Price2 = double.parse(value);

                                }
                                setState((){
                                  Total2=Qnty2 * Price2;
                                  GoundTotal=Total1+Total2;
                                });
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
                          child: InkWell(

                              child: Text("${Total2}")
                          ))

                    ],
                  ),


                ],
              ),
              //3rd
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          'PRODUCT 3',
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ),
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
                          value: _payproducts3,
                          onChanged: (value) {
                            setState(() {
                              _payproducts3 = value.toString();
                            });
                          },
                          items: _payproductList3.map((itemone) {
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
                            controller: _conQnty3,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Qnty3=0;
                                  Total3=0;
                                }else{
                                  Qnty3 = double.parse(value);
                                  Total3=Qnty3 * Price3;
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
                            controller: _conPrice3
                            ,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Price3=0;
                                  Total3=0;
                                }else{
                                  Price3 = double.parse(value);
                                  Total3=Qnty3 * Price3;

                                }
                                setState((){
                                  GoundTotal=Total1+Total2+Total3;
                                });
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
                          child: Text("${Total3}"))

                    ],
                  ),


                ],
              ),
              //4th
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          'PRODUCT 4',
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ),
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
                          value: _payproducts4,
                          onChanged: (value) {
                            setState(() {
                              _payproducts4 = value.toString();
                            });
                          },
                          items: _payproductList4.map((itemone) {
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
                             controller: _conQnty4,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Qnty4=0;
                                  Total4=0;
                                }else{
                                  Qnty4 = double.parse(value);
                                  Total4=Qnty4*Price4;

                                }
                                setState((){

                                  GoundTotal=Total3+Total2+Total3+Total4;
                                });
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
                             controller: _conPrice4,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Price4=0;
                                  Total4=0;
                                }else{
                                  Price4 = double.parse(value);
                                  Total4=Qnty4*Price4;
                                }
                                setState((){
                                  GoundTotal=Total3+Total2+Total3+Total4;
                                });
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
                          child: InkWell(

                              child: Text("${Total4}")
                          ))

                    ],
                  ),


                ],
              ),
              //5th
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          'PRODUCT 5',
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ),
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
                          value: _payproducts5,
                          onChanged: (value) {
                            setState(() {
                              _payproducts5 = value.toString();
                            });
                          },
                          items: _payproductList5.map((itemone) {
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
                             controller: _conQnty5,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Qnty5=0;
                                  Total5=0;
                                }else{
                                  Qnty5 = double.parse(value);
                                  Total5=Qnty5 * Price5;
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
                             controller: _conPrice5,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Price5=0;
                                  Total5=0;

                                }else{
                                  Price5 = double.parse(value);
                                  Total5=Qnty5 * Price5;

                                }
                                setState((){
                                  GoundTotal=Total1+Total2+Total3+Total4+Total5;
                                });
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
                          child: InkWell(

                              child: Text("${Total5}")
                          ))

                    ],
                  ),


                ],
              ),
              //6th
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          'PRODUCT6',
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ),
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
                          value: _payproducts6,
                          onChanged: (value) {
                            setState(() {
                              _payproducts6 = value.toString();
                            });
                          },
                          items: _payproductList6.map((itemone) {
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
                             controller: _conQnty6,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Qnty6=0;
                                  Total6=0;
                                }else{
                                  Qnty6 = double.parse(value);
                                  Total6=Qnty6*Price6;

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
                             controller: _conPrice6,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Price6=0;
                                  Total6=0;
                                }else{
                                  Price6 = double.parse(value);
                                  Total6=Qnty6*Price6;

                                }
                                setState((){
                               GoundTotal=Total1+Total2+Total3+Total4+Total5+Total6;
                                });
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
                          child: InkWell(

                              child: Text("${Total6}")
                          ))

                    ],
                  ),


                ],
              ),
              //7th
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          'PRODUCT 7',
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ),
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
                          value: _payproducts7,
                          onChanged: (value) {
                            setState(() {
                              _payproducts7 = value.toString();
                            });
                          },
                          items: _payproductList7.map((itemone) {
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
                             controller: _conQnty7,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Qnty7=0;
                                  Total7=0;
                                }else{
                                  Qnty7 = double.parse(value);
                                  Total7=Qnty7 * Price7;
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
                            //
                            //
                            controller: _conPrice7,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Price7=0;
                                  Total7=0;
                                }else{
                                  Price7 = double.parse(value);
                                  Total7=Qnty7*Price7;
                                }
                                setState((){
                                  GoundTotal=Total1+Total2+Total3+Total4+Total5+Total6+Total7;
                                });
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
                          child: InkWell(

                              child: Text("${Total7}")
                          ))

                    ],
                  ),


                ],
              ),
              //8th
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          'PRODUCT 8',
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ),
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
                          value: _payproducts8,
                          onChanged: (value) {
                            setState(() {
                              _payproducts8 = value.toString();
                            });
                          },
                          items: _payproductList8.map((itemone) {
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
                           controller: _conQnty8,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Qnty8=0;
                                  Total8=0;
                                }else{
                                  Qnty8 = double.parse(value);
                                  Total8=Qnty8 * Price8;
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
                             controller: _conPrice8,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Price8=0;
                                  Total8=0;
                                }else{
                                  Price8 = double.parse(value);
                                  Total8=Qnty8*Price8;

                                }
                                setState((){
                                 GoundTotal= Total1+Total2+Total3+Total4+Total5+Total6+Total7+Total8;
                                });
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
                          child: InkWell(

                              child: Text("${Total8}")
                          ))

                    ],
                  ),


                ],
              ),
              //9th
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          'PRODUCT 9',
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ),
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
                          value: _payproducts9,
                          onChanged: (value) {
                            setState(() {
                              _payproducts9 = value.toString();
                            });
                          },
                          items: _payproductList9.map((itemone) {
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
                            controller: _conQnty9,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Qnty9=0;
                                  Total9=0;
                                }else{
                                  Qnty9 = double.parse(value);
                                  Total9=Qnty9 * Price9;
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
                            controller: _conPrice9,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Price9=0;
                                  Total9=0;
                                }else{
                                  Price9 = double.parse(value);
                                  Total9=Qnty9 * Price9;
                                }
                                setState((){
                                  GoundTotal=Total1+Total2+Total3+Total4+Total5+Total6+Total7+Total8+Total9;

                                });
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
                          child: InkWell(

                              child: Text("${Total9}")
                          ))

                    ],
                  ),


                ],
              ),
////// 10th
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          'PRODUCT 10',
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ),
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
                          value: _payproducts10,
                          onChanged: (value) {
                            setState(() {
                              _payproducts10 = value.toString();
                            });
                          },
                          items: _payproductList10.map((itemone) {
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
                            controller: _conQnty10,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Qnty10=0;
                                  Total10=0;
                                }else{
                                  Qnty10 = double.parse(value);
                                  Total9=Qnty9 * Price9;
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
                             controller: _conPrice10,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize:10
                            ),
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Price10=0;
                                  Total10=0;
                                }else{
                                  Price10 = double.parse(value);
                                  Total10=Qnty10 * Price10;

                                }
                                setState((){
                                  GoundTotal=Total1+Total2+Total3+Total4+Total5+Total6+Total7+Total8+Total9+Total10;

                                });
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
                          child: InkWell(

                              child: Text("${Total10}")
                          ))

                    ],
                  ),


                ],
              ),
           Divider(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text('TOTAL                ',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  width: 200.0,
                  height: 30.0,
                  child: Row(
                    children: [
                      Text('GH¢'),
                      Text("${GoundTotal}"),
                    ],
                  )
                ),
              ],
            ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text('PAYMENT          ',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    width: 200.0,
                    height: 30.0,
                    child: Row(
                      children: [
                        Text('GH¢'),
                        Container(
                          height: 50.0,
                          width: 150.0,
                          child: TextField(
                            onChanged: (value){
                              setState((){
                                if(value.isEmpty){
                                  Balance=0;

                                }else{
                                  Payment = double.parse(value);
                                  Balance=GoundTotal-Payment;
                                }

                              });
                            },
                            keyboardType: TextInputType.number,
                            decoration:InputDecoration(

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text('BALANCE          ',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    width: 200.0,
                    height: 30.0,
                    child: Row(
                      children: [
                        Text('GH¢'),
                        Text("${Balance}"),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text('WAYBILL            ',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    width: 200.0,
                    height: 30.0,
                    child: TextField(
                      controller: Waybill,
                      decoration:InputDecoration(

                      ),
                    ),
                  ),
                ],
              ),

              Divider(),

            ],
          ),

          // Quatar
        ],
      ),
    );
  }
}
