import 'package:flutter/material.dart';
import 'package:gnexus/screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:gnexus/screens/sign_up_screen/sign_up_screen.dart';
import 'package:gnexus/screens/verification_screen/verification_screen.dart';
import 'package:gnexus/services/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/bottom_navigation/bottom_navigation.dart';
import '../../screens/login_screen/login_screen.dart';
import '../../utils/utils_variable/variables.dart';


GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MainNavigator extends StatelessWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = navigatorKey.currentState?.canPop() ?? false;
        if (canPop) {
          navigatorKey.currentState?.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute:UtilsVariables.loginUser? MainRoutes.mainPage:MainRoutes.register,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder? builder;
          switch (settings.name) {

            case MainRoutes.register:
              builder = (BuildContext _) => RegisterScreen();
              break;
              case MainRoutes.login:
              builder = (BuildContext _) => LoginScreen();
              break;
              case MainRoutes.forgotPassword:
              builder = (BuildContext _) => ForgotPasswordScreen();
              break;
              case MainRoutes.verificationScreen:
              builder = (BuildContext _) => VerificationScreen();
              break;
              case MainRoutes.mainPage:
              builder = (BuildContext _) => MainPage(selectedIndex: 0,);
              break;

          }
          if (builder != null) {
            return MaterialPageRoute(builder: builder, settings: settings);
          }
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
