import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gnexus/presentation/screens/family_tree_screen/profile/my_plan.dart';
import 'package:gnexus/presentation/screens/family_tree_screen/profile/profile.dart';
import 'package:gnexus/presentation/screens/profiles_screen/photos_screen.dart';
import 'package:gnexus/presentation/screens/profiles_screen/profile_all_connec_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../blocs/auth_bloc/sign_in_bloc/sign_in_bloc.dart';
import '../../../blocs/auth_bloc/sign_up_bloc.dart';
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

  /// For bloc
  late SignInBloc signInBloc;
  @override
  void initState() {
    signInBloc = BlocProvider.of<SignInBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) async {
          if (state is UserSignInChakecdState) {
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            UtilsVariables.userName = state.profileModelInfo.username ?? "";
            await prefs.setString('accessToken', state.profileModelInfo.tokens?.access ?? "");
            bool? navigate = prefs.getBool("confirmEmail");
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainPage(selectedIndex: 0)));
            // (navigate ?? false)
            //     ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainPage(selectedIndex: 0)))
            //     : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerificationScreen(routName: 'enterFirst',)));
            UtilsVariables.errorText=null;
          }
        },
        builder: (context, state) {
          if (state is UserSignInInitialState) {
            return buildLoading();
          }
          if (state is UserSignInChakecdState) {
            return buildLoading();
          }
          if (state is UserSignInLoggedState) {
            return buildUi(context);
          }
          if (state is UserSignInErrorState) {
            return buildPageException(state.message);
          }
          return const Center(child: Text("FlutterApp"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PhotosScreen()),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }


  Widget buildPageException(String message){
    return Center(
      child: Text(message.toString()),
    );
  }

  Widget buildLoading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }




  Widget buildUi(BuildContext context){
    return Padding(
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
                errorText: UtilsVariables.errorText,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Password",
                textController: passwordController,
                // errorText: UtilsVariables.errorText,
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                  width: double.infinity,
                  height: 46,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      signInBloc.add(UserSignInSendDataEvent(context: context, emile: emailController.text, password:  passwordController.text));
                    }
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) => MainPage(selectedIndex: 0)));
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
    );
  }

  void login(String email, String password, BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await LoginRepository.getInstance().login(email, password);
    profileModelInfo = response;
    if (StatusCode.successStatusCode == 200) {

      UtilsVariables.userName = profileModelInfo!.firstName!;
      await prefs.setString('accessToken', (profileModelInfo?.tokens?.access).toString());
      bool? navigate = prefs.getBool("confirmEmail");
      Navigator.of(context).popUntil((route) => route.isFirst);
      (navigate ?? false)
          ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainPage(selectedIndex: 0)))
          : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerificationScreen(routName: 'enterFirst',)));
      UtilsVariables.errorText=null;
    }
    Future.delayed(Duration(seconds: 1));{
      setState(() {

      });
    }
  }
}
