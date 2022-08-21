import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';


// Todaydate(){
//   String Dat2=DateFormat.yMEd().add_jms().format(  DateTime.now());
//   return Dat2.toString();
// }

showmgs(BuildContext context){
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Connection Error !"),
        content: Text("Please connect to the internet."),
      )
  );

}
void myToast(String msg) {
  Fluttertoast.showToast(
    backgroundColor: Colors.blue,
    textColor: Colors.white,
    msg: msg,
  );
}

// to show information to user. this to replace the Toast
snackbar(BuildContext context,String textmsg){
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(textmsg,
        style: TextStyle(color: Colors.white)),
    backgroundColor: Colors.black87,
  ));
}
Todaydate(){
  String Dat2=DateFormat.yMEd().add_jms().format(  DateTime.now());
  return Dat2.toString();
}
