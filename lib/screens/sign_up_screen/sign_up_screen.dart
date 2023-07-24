import 'package:flutter/material.dart';
import 'package:gnexus/widgets/custom/custom_button.dart';

import '../../services/routes/routes_name.dart';
import '../../widgets/custom/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),

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
                    "Hello!\nSign Up To\nGet Started",
                    style: TextStyle(
                        fontSize: 40,
                        color: Color(0xff000080),
                        fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                height: 80,
              ),
              Image.asset("assets/man.png"),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                hintText: "Full Name",
              ),
              SizedBox(
                height: 20,
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
                  title: "Sign up",
                  color: Color(0xff000080)),
              Row(
                children: [
                  Text('Already Have An Account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MainRoutes.login);
                      },
                      child: Text('Sign In',
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
