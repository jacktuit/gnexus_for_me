import 'package:flutter/material.dart';
import 'package:gnexus/presentation/screens/profiles_screen/profile_all_connec_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/apis/login_api/sign_in_api.dart';
import '../../../data/models/login_model/sign_in_model.dart';
import '../../../services/routes/routes_name.dart';
import '../../../utils/status_code/status_code.dart';
import '../../../utils/utils_variable/variables.dart';
import '../../widgets/custom/custom_button.dart';
import '../../widgets/custom/custom_textfield.dart';
import '../bottom_navigation/bottom_navigation.dart';
import '../verification_screen/verification_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ProfileModel? profileModelInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
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
                  textController: emailController,
                  hintText: "Email Address",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: "Password",
                  textController: passwordController,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomButton(
                    width: double.infinity,
                    height: 46,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        login(emailController.text, passwordController.text,
                            context);
                      }
                    },
                    title: "Sign In",
                    color: Color(0xff000080)),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, MainRoutes.forgotPassword);
                        },
                        child: Text(
                          'Forget Your Password?',
                          style: TextStyle(color: Colors.black),
                        )),
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, MainRoutes.register);
                        },
                        child: Text('Sign up',
                            style: TextStyle(color: Color(0xff000080))))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfileAllConnectionsScreen()),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }

  void login(String email, String password, BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await LoginRepository.getInstance().login(email, password);
    profileModelInfo = response;

    if (StatusCode.successStatusCode == 200) {
      UtilsVariables.userName = profileModelInfo!.firstName!;
      await prefs.setString(
          'accessToken', (profileModelInfo?.tokens?.access).toString());
      bool? navigate = prefs.getBool("confirmEmail");

      Navigator.of(context).popUntil((route) => route.isFirst);
      (navigate ?? false)
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      MainPage(selectedIndex: 0)))
          : Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => VerificationScreen(
                        routName: 'enterFirst',
                      )));
    }
  }
}
