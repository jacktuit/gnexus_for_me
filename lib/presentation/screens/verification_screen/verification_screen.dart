import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:gnexus/presentation/screens/forgot_password_screen/enter_new_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/custom/custom_button.dart';
import '../bottom_navigation/bottom_navigation.dart';


class VerificationScreen extends StatefulWidget {
  final String routName;
  const VerificationScreen({Key? key, required this.routName}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/coming_message.png"),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Verification",
              style: TextStyle(
                  color: Color(0xff000080),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Enter the verification code we just sent\nyou on your registered phone number",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Enter code here",
              textAlign: TextAlign.center,
            ),
            VerificationCode(
              textStyle: TextStyle(fontSize: 20.0, color: Colors.black),
              keyboardType: TextInputType.number,
              underlineColor: Color(0xff000080),
              // If this is null it will use primaryColor: Colors.red from Theme
              length: 4,
              cursorColor: Color(0xff000080),
              // If this is null it will default to the ambient
              // clearAll is NOT required, you can delete it
              // takes any widget, so you can implement your design
              // clearAll: Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     'clear all',
              //     style: TextStyle(fontSize: 14.0, decoration: TextDecoration.underline, color: Color(0xff000080)),
              //   ),
              // ),
              onCompleted: (String value) {
                setState(() {
                  // _code = value;
                });
              },
              onEditing: (bool value) {
                setState(() {
                  // _onEditing = value;
                });
                // if (!_onEditing) FocusScope.of(context).unfocus();
              },
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "If you didn’t receive the code?",
                  style: TextStyle(color: Color(0xff8000000d)),
                ),
                Text(
                  " Resend",
                  style: TextStyle(color: Color(0xff000080)),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              onPressed: () async{
                print(widget.routName);
                if(widget.routName=="forgotPassword"){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>EnterNewLogin()));

                }else{
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setBool('confirmEmail', true);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MainPage(selectedIndex: 0)));

                }


              },
              title: "Verify",
              color: Color(0xff000080),
              width: double.infinity,
              height: 46,
            )
          ],
        ),
      ),
    );
  }
}
