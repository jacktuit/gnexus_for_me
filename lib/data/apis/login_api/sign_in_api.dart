import 'dart:convert';
import 'package:gnexus/utils/status_code/status_code.dart';
import 'package:http/http.dart' as http;

import '../../models/login_model/sign_in_model.dart';

class LoginRepository {
  static final LoginRepository _singleton = LoginRepository._internal();

  LoginRepository._internal();

  static LoginRepository getInstance() {
    return _singleton;
  }

  Future<ProfileModel> login(
    String email,
    String password,
  ) async {
    ProfileModel? fileUrl;
    final requestParameters = {
      "email": email,
      "password": password,
    };
    try {
      final requestUrl = Uri.parse("https://api.gnexus.uz/api/login/");
      final response = await http.post(
        requestUrl,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(requestParameters),
      );
      final int statusCode = response.statusCode;

      print(statusCode);
      StatusCode.successStatusCode=statusCode;
      if (statusCode == 200) {
        final resultClass = json.decode(utf8.decode(response.bodyBytes));
        print(resultClass);
        print(utf8.decode(response.bodyBytes));
        fileUrl = ProfileModel.fromJson(resultClass);
      }
    } catch (e) {
      print("e");
      print(e);
    }

    return fileUrl ?? ProfileModel();
  }
}
