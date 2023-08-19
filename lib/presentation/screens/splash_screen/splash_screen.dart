import 'package:flutter/material.dart';

import 'package:gnexus/data/models/login_model/profile_access_model.dart';
import 'package:gnexus/presentation/screens/bottom_navigation/bottom_navigation.dart';
import 'package:gnexus/presentation/screens/sign/sign_in_screen.dart';

import '../../../data/apis/login_api/profile_access.dart';
import '../../../services/routes/routes_name.dart';
import '../../../utils/status_code/status_code.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ProfileAccess? profileAccessInfo;

  @override
  void initState() {
    navigator();
    super.initState();
  }

  void navigator() async {
    await Future.delayed(Duration.zero);
    {
   final statusCode = await ProfileAccessRepository.getInstance().sendToken();
      Future.delayed(Duration(seconds: 2)).then((value) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        if (statusCode == 200) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      MainPage(selectedIndex: 0)));
        } else {
          Navigator.pushReplacementNamed(context, MainRoutes.login);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/gn_logo.png"),
      ),
    );
  }
}
