import 'package:flutter/material.dart';
import '../../../data/apis/password_api/forgot_password_api.dart';
import '../../../services/routes/routes_name.dart';
import '../../widgets/custom/custom_button.dart';
import '../../widgets/custom/custom_textfield.dart';
import '../verification_screen/verification_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {


  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,

        child: Padding(
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
                "Forgot  Password ?!",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000080),
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "We just need your registered phone number to\n send you password reset code",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 80,
              ),
              CustomTextField(
                textController: emailController,
                hintText: "Email Address",
              ),
              SizedBox(
                height: 80,
              ),
              CustomButton(
                width: double.infinity,
                height: 46,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ForgotPasswordRepository.getInstance().forgotPassword(context, emailController.text);

                  }


                },
                title: 'Reset Password',
                color: Color(0xff000080),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, MainRoutes.register);
                      },
                      child: Text('Register Now',
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
