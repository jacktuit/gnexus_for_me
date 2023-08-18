import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:gnexus/data/models/login_model/sign_up_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../blocs/auth_bloc/sign_up_bloc.dart';
import '../../../data/apis/login_api/sign_up_api.dart';
import '../../../services/routes/routes_name.dart';

import '../../../utils/utils_variable/variables.dart';
import '../../widgets/custom/custom_button.dart';
import '../../widgets/custom/custom_textfield.dart';
import '../verification_screen/verification_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
  final emailController = TextEditingController();
  final passWordController = TextEditingController();
  final lastnameController = TextEditingController();
  bool showErrorName = false;
  SignUpModel? signUpModelInfo;
  File? documentFile;
  File? imageCameraForView;
  final ImagePicker _picker = ImagePicker();

  /// For bloc
  late SignUpBloc signUpBloc;

  @override
  void initState() {
    signUpBloc = BlocProvider.of<SignUpBloc>(context);
    UtilsVariables.errorTextEmail = '';
    UtilsVariables.errorTextPassword = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is UserSignUpCodeVerifiState) {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => VerificationScreen(routName: 'sign up',)));
          }
        },
        builder: (context, state) {
          if (state is UserSignUpInitialState) {
            return buildLoading();
          }
          if (state is UserSignUpCodeVerifiState) {
            return buildLoading();
          }
          if (state is UserSignUpLoggedState) {
            return buildUi(context);
          }
          if (state is UserSignUpErrorState) {
            return buildPageException(state.message);
          }
          return const Center(child: Text("FlutterApp"));
        },
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
              imageCameraForView != null
                  ? InkWell(
                  onTap: () {},
                  child: Image.file(imageCameraForView!, height:100,fit: BoxFit.cover,))
                  : InkWell(
                  onTap: () {
                    _onImageButtonPressed(ImageSource.camera,
                        context: context);
                  },
                  child: Image.asset("assets/man.png")),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: _signInWithFacebook,
                child: Text('Sign up with Facebook'),
              ),

              CustomTextField(
                hintText: "First name",
                textController: firstnameController,
                errorText: showErrorName ? "Enter first and last name" : null,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Last name",
                textController: lastnameController,
                errorText: showErrorName ? "Enter first and last name" : null,
              ),
              SizedBox(
                height: 20,
              ),

              CustomTextField(
                hintText: "Email Address",
                textController: emailController,
                errorText: UtilsVariables.errorTextEmail == ''
                    ? null
                    : UtilsVariables.errorTextEmail,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Password",
                textController: passWordController,
                errorText: UtilsVariables.errorTextPassword == ''
                    ? null
                    : UtilsVariables.errorTextPassword,
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                  width: double.infinity,
                  height: 46,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        signUpBloc.add(UserSignUpSendDataEvent(
                          context: context,
                          firstName: firstnameController.text,
                          lastname: lastnameController.text,
                          userName:  "",
                          emile:  emailController.text,
                          password: passWordController.text,
                        ));
                        // signUp(
                        //     firstnameController.text,
                        //     lastnameController.text,
                        //     "",
                        //     emailController.text,
                        //     passWordController.text,
                        //     context);

                        showErrorName = false;
                        setState(() {});
                      } catch (e) {
                        print("Teststs");
                        showErrorName = true;
                        setState(() {});
                      }
                    }
                    await Future.delayed(Duration(milliseconds: 500));
                    {
                      setState(() {});
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
    );
  }

  Future<void> _onImageButtonPressed(
    ImageSource source, {
    required BuildContext context,
  }) async {
    if (mounted) {
      {
        try {
          final XFile? pickedFile = await _picker.pickImage(
            source: source,
            maxWidth: 480,
            maxHeight: 640,
            imageQuality: 100,
          );
          setState(() {
            // _setImageFileListFromFile(pickedFile);
            pickImageCameraAndUpload(context, pickedFile);
          });
        } catch (e) {
          setState(() {});
        }
      }
    }
  }
  Future<void> _signInWithFacebook() async {
    try {
      // Log in with Facebook
      LoginResult accessToken = await FacebookAuth.instance.login();

      // Get user data from the Graph API
      final userData = await FacebookAuth.instance.getUserData();

      // You can now use the obtained data to create an account or perform other actions
      // For example, you can access the user's email using 'userData["email"]'
      print("Facebook User ID: ${userData["id"]}");
      print("Facebook User Name: ${userData["name"]}");
      print("Facebook User Email: ${userData["email"]}");
    } catch (e) {
      print("Facebook sign-in error: $e");
    }
  }

  Future<void> pickImageCameraAndUpload(
      BuildContext context, XFile? imageCamera) async {
    if (imageCamera != null) {
      documentFile = File(imageCamera.path);
      setState(() {});
      Future.delayed(Duration(seconds: 1));
      try {
        final imageTempCamera = File(imageCamera.path);
        setState(() => this.imageCameraForView = imageTempCamera);
        print(imageCamera);
        setState(() {});
      } on PlatformException catch (e) {
        print('Failed to pick image: $e');
      }
    }
  }

  void signUp(String firstName, String lastName, String userName, String email,
      String password, BuildContext context) async {
    final result = await SignUpRepository.getInstance()
        .signUp(context, firstName, lastName, userName, email, password);
    signUpModelInfo = result;

  }
}
