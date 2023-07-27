import 'dart:convert';

import 'package:gnexus/data/models/login_model/profile_access_model.dart';
import 'package:http/http.dart' as http;
import '../../../utils/status_code/status_code.dart';

class ProfileAccessRepository {
  static final ProfileAccessRepository _singleton =
      ProfileAccessRepository._internal();
  ProfileAccessRepository._internal();
  static ProfileAccessRepository getInstance() {
    return _singleton;
  }
  Future<ProfileAccess> sendToken(
  ) async {
    ProfileAccess? fileUrl;
    try {
      final requestUrl = Uri.parse("https://api.gnexus.uz/api/profile/");
      final response = await http.get(
        requestUrl,
        headers: {
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkwNDU2NDQzLCJpYXQiOjE2OTA0MzQ4NDMsImp0aSI6ImI4Y2QyZmI3NTU0ZDQ0MTBhZDc2ODJkMWZhNzgwYTNlIiwidXNlcl9pZCI6ImI5MmViMzY3LTAyYTktNDJhMS04MjRjLTRmNjA3OGFhMmUwNSJ9.uEgE9o4pUldZxA4NyVAZbOZKLW_k6w3tzw7H8vfA0GY'
        },

      );
      final int statusCode = response.statusCode;

      print(statusCode);
      StatusCode.successStatusCode = statusCode;
      if (statusCode == 200) {
        final resultClass = json.decode(utf8.decode(response.bodyBytes));
        print(resultClass);
        print(utf8.decode(response.bodyBytes));
        fileUrl = ProfileAccess.fromJson(resultClass);
      }
    } catch (e) {
      print("e");
      print(e);
    }

    return fileUrl ?? ProfileAccess();
  }
}