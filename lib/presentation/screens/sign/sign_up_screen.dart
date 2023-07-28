import 'package:flutter/material.dart';
import 'package:gnexus/data/models/login_model/sign_up_model.dart';

import '../../../data/apis/login_api/sign_up_api.dart';
import '../../../services/routes/routes_name.dart';

import '../../widgets/custom/custom_button.dart';
import '../../widgets/custom/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passWordController = TextEditingController();
  final userNameController = TextEditingController();
  bool showErrorName = false;
  SignUpModel? signUpModelInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),
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
                  textController: fullNameController,
                  errorText: showErrorName ? "Enter first and last name" : null,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: "Surname",
                  textController: userNameController,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: "Email Address",
                  textController: emailController,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: "Password",
                  textController: passWordController,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomButton(
                    width: double.infinity,
                    height: 46,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        try {
                          var str = fullNameController.text;
                          var index = str.indexOf(' ');
                          var firstName = str.substring(0, index);
                          var lastName = str.substring(index).replaceAll(" ", '');
                          signUp(firstName,lastName,userNameController.text,emailController.text,passWordController.text);

                          showErrorName = false;
                          setState(() {});
                        } catch (e) {
                          print("Teststs");
                          showErrorName = true;
                          setState(() {});
                        }
                      }
                    },
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
      ),
    );
  }

  void signUp(String firstName,String lastName,String userName,String email,String password,)async{
    final result = await SignUpRepository.getInstance().signUp(firstName, lastName, userName, email, password);
    signUpModelInfo=result;


  }
}
