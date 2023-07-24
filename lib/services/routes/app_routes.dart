import 'package:flutter/material.dart';
import 'package:gnexus/screens/sign_up_screen/sign_up_screen.dart';
import 'package:gnexus/services/routes/routes_name.dart';

import '../../screens/login_screen/login_screen.dart';


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
        initialRoute: MainRoutes.sign,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder? builder;
          switch (settings.name) {

            case MainRoutes.sign:
              builder = (BuildContext _) => SignUpScreen();
              break;
              case MainRoutes.login:
              builder = (BuildContext _) => LoginScreen();
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
