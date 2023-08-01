import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../services/routes/routes_name.dart';
import '../../widgets/custom/custom_button.dart';
import '../../widgets/custom/custom_textfield.dart';
class EnterNewLogin extends StatefulWidget {
   EnterNewLogin({Key? key}) : super(key: key);

  @override
  State<EnterNewLogin> createState() => _EnterNewLoginState();
}

class _EnterNewLoginState extends State<EnterNewLogin> {
  final passWordController = TextEditingController();

   bool showError=false;

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
            CustomTextField(hintText: "Enter new password",
            textController: passWordController,
              errorText: showError?'You should enter minimum character 8':null,
            ),
            SizedBox(height: 80,),
            CustomButton(
              width: double.infinity,
              height: 46,
              onPressed: () {
                if(passWordController.text.length<=7){
                  showError=true;
                  setState(() {

                  });

                }else{
                  Navigator.of(context).popUntil((route) => route.isFirst);

                  Navigator.pushReplacementNamed(context, MainRoutes.mainPage);
                }


              }, title: 'Enter', color: Color(0xff000080),),
            SizedBox(height: 40,),

          ],
        ),
      ),
    );
  }
}
