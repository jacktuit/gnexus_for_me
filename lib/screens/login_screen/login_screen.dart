import 'package:flutter/material.dart';
import 'package:gnexus/widgets/custom/custom_button.dart';

import '../../widgets/custom/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(leading:IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.arrow_back_rounded),),),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                  width: 266,
                  child: Text(
                    "Hello Again!\nWelcome\nBack",
                    style: TextStyle(
                        fontSize: 40,
                        color: Color(0xff000080),
                        fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                height: 80,
              ),


              CustomTextField(
                hintText: "Email Address",
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Password",
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                  width: double.infinity,
                  height: 46,
                  onPressed: () {},
                  title: "Sign In",
                  color: Color(0xff000080)),
              Row(
                children: [
                  Text('Forget Your Password?'),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Sign up',
                          style: TextStyle(color: Color(0xff000080))))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
