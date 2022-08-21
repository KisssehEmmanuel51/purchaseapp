

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {


    return ListView(
      children: [
        Form(child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(

                keyboardType: TextInputType.text,

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
            TextFormField(),
            TextFormField(),
          ],
        ))
      ],
    );
  }
}
