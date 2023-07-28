import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gnexus/data/models/login_model/sign_up_model.dart';
import 'package:gnexus/presentation/screens/sign/sign_in_screen.dart';
import 'package:gnexus/utils/status_code/status_code.dart';
import 'package:http/http.dart' as http;

import '../../models/login_model/sign_in_model.dart';

class SignUpRepository {
  static final SignUpRepository _singleton = SignUpRepository._internal();

  SignUpRepository._internal();

  static SignUpRepository getInstance() {
    return _singleton;
  }

  Future<SignUpModel> signUp(
    BuildContext context,
    String firstName,
    String lastName,
    String userName,
    String email,
    String password,
  ) async {
    SignUpModel? signInfo;
    final requestParameters = {
      "username": userName,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
    };
    try {
      final requestUrl = Uri.parse("https://api.gnexus.uz/api/register/");
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
      if (statusCode == 201) {
        signInfo = SignUpModel.fromJson(resultClass);
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        final snackBar = SnackBar(
          content: Text("${resultClass['email']}"
                  .replaceAll("null", '')
                  .replaceAll("[", '')
                  .replaceAll("]", '') +
              "\n" +
              "${resultClass['password']}"
                  .replaceAll("null", '')
                  .replaceAll("[", '')
                  .replaceAll("]", '')),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      print("e");
      print(e);
    }

    return signInfo ?? SignUpModel();
  }
}
