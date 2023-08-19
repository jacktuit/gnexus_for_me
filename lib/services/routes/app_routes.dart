import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gnexus/services/routes/routes_name.dart';
import '../../blocs/auth_bloc/sign_in_bloc/sign_in_bloc.dart';
import '../../blocs/auth_bloc/sign_up_bloc.dart';
import '../../presentation/screens/bottom_navigation/bottom_navigation.dart';
import '../../presentation/screens/forgot_password_screen/forgot_password_screen.dart';
import '../../presentation/screens/sign/sign_in_screen.dart';
import '../../presentation/screens/sign/sign_up_screen.dart';

import '../../presentation/screens/splash_screen/splash_screen.dart';
import '../../presentation/screens/verification_screen/verification_screen.dart';

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
        initialRoute:MainRoutes.splashScreen,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder? builder;
          switch (settings.name) {

            case MainRoutes.register:
              builder = (BuildContext _) => MultiBlocProvider(
                providers: [
                  BlocProvider<SignUpBloc>(
                    create: (context) => SignUpBloc(),
                  ),
                ],
                child: RegisterScreen(),
              );
              break;
              case MainRoutes.login:
              builder = (BuildContext _) => MultiBlocProvider(
                providers: [
                  BlocProvider<SignInBloc>(
                    create: (context) => SignInBloc(),
                  ),
                ],
                child: LoginScreen(),
              );
              break;
              case MainRoutes.splashScreen:
              builder = (BuildContext _) => SplashScreen();
              break;
              case MainRoutes.forgotPassword:
              builder = (BuildContext _) => ForgotPasswordScreen();
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
