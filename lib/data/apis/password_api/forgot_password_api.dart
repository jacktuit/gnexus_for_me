import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gnexus/data/models/login_model/sign_up_model.dart';
import 'package:gnexus/presentation/screens/sign/sign_in_screen.dart';
import 'package:gnexus/utils/status_code/status_code.dart';
import 'package:gnexus/utils/utils_variable/variables.dart';
import 'package:http/http.dart' as http;

import '../../../presentation/screens/verification_screen/verification_screen.dart';
import '../../models/login_model/sign_in_model.dart';

class ForgotPasswordRepository {
  static final ForgotPasswordRepository _singleton =
      ForgotPasswordRepository._internal();

  ForgotPasswordRepository._internal();

  static ForgotPasswordRepository getInstance() {
    return _singleton;
  }

  Future<dynamic> forgotPassword(
    BuildContext context,
    String email,
  ) async {
    final requestParameters = {
      "email": email,
    };
    try {
      final requestUrl =
          Uri.parse("https://api.gnexus.uz/api/resend-confirmation-email/");
      final response = await http.post(
        requestUrl,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(requestParameters),
      );
      final int statusCode = response.statusCode;
      print(statusCode);
      StatusCode.successStatusCode = statusCode;
      final resultClass = json.decode(utf8.decode(response.bodyBytes));
      if (statusCode == 200) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => VerificationScreen(
                      routName: 'forgotPassword',
                    )));
        return resultClass;
      } else {

        UtilsVariables.errorForgotPassword=resultClass['email'];

      }
    } catch (e) {
      print("e");
      print(e);
      UtilsVariables.errorForgotPassword="Can not find email address!";

    }

    return;
  }
}
