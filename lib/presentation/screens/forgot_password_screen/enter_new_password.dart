import 'package:flutter/material.dart';

import '../../../services/routes/routes_name.dart';
import '../../widgets/custom/custom_button.dart';
import '../../widgets/custom/custom_textfield.dart';
class EnterNewLogin extends StatelessWidget {
  const EnterNewLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/password-icon.png"),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Enter new  assword !",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xff000080),
                  fontSize: 20),
            ),
            SizedBox(height: 20,),

            SizedBox(height: 80,),
            CustomTextField(hintText: "Enter new password",),
            SizedBox(height: 80,),
            CustomButton(
              width: double.infinity,
              height: 46,
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);

                Navigator.pushReplacementNamed(context, MainRoutes.mainPage);

              }, title: 'Enter', color: Color(0xff000080),),
            SizedBox(height: 40,),

          ],
        ),
      ),
    );
  }
}
