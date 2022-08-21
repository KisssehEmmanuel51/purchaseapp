import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:purchase/home_page.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>  {
  final  registerglobal=GlobalKey<FormState>();
  final TextEditingController _admin_name=TextEditingController();
  final TextEditingController _admin_password=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            top: true,
              child: Container(alignment: Alignment.center,
                color: Colors.grey ,
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                child: ListTile(
                  title: CircleAvatar(radius: 35,
                    child: Icon(Icons.person_pin,size: 70,)
                  ),
                  subtitle: Text('Adminstrator',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                    ),
                  ),
                ),
              )),
          Divider(
            thickness: 18,
          ),
          Divider(),
                 SizedBox(
                   height: 80.0,
                 ),

                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(

                     width: 250.0,
                     decoration: BoxDecoration(
                       border: Border.all(),
                       borderRadius: BorderRadius.circular(7.0)
                     ),
                     child: Form(
                       key: registerglobal,
                       child: Column(
                       children: [


                         Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: TextFormField(
                             keyboardType: TextInputType.text,
                              controller: _admin_name,
                             validator: (value) {
                               if (value!.isEmpty) {
                                 return 'Enter admin name ';
                               }
                               return null;
                             },
                             decoration: InputDecoration(
                                 labelText: 'Name',
                                 prefixIcon: Icon(Icons.person,color: Colors.grey,),
                                 prefixStyle: TextStyle(color: Colors.black),
                                 hintText: 'Admin Name ',
                                 border: OutlineInputBorder(
                                     borderSide: BorderSide(
                                         width: 23.0, color: Colors.grey))),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: TextFormField(

                             keyboardType: TextInputType.text,
                             controller: _admin_password,
                             validator: (value) {
                               if (value!.isEmpty) {
                                 return 'Enter password ';
                               }
                               return null;
                             },
                             decoration: InputDecoration(

                                 labelText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                                 prefixStyle: TextStyle(color: Colors.black),
                                 hintText: 'Password ',
                                 border: OutlineInputBorder(
                                     borderSide: BorderSide(
                                         width: 23.0, color: Colors.black))),
                             obscureText: true,
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.fromLTRB(100, 20, 70, 100),
                           child: ElevatedButton(onPressed: (){
                             if (registerglobal.currentState!.validate()) {
                               setState(() {
                               });
                               if(_admin_password.text=='admin' && _admin_name.text=='admin'){
                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage()));
                               }else{
                                 return null;
                               }

                             } else {
                               return null;
                             }

                           }, child: Text('Login',style: TextStyle(fontSize:30),)),
                         ),
                         Row(
                           children: [
                             Text('Dont have an account?'),
                             TextButton(onPressed:(){}, child: Text('Register'))
                           ],
                         )

                       ],
                     ),

                     ),
                   ),
                 ),

        ]));
  }
}
