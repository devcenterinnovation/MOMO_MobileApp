import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:momo/dialogs_snackbar.dart';
import 'package:momo/services/internet_services.dart';
import 'package:momo/services/response_handling.dart';
import 'package:momo/views/signup_screens/onboarding_screens.dart';

class ApiDocs {
  static final BASE_URL = "https://momo-app-prdo9.ondigitalocean.app/";

  static final LOGIN_URL = BASE_URL + "auth/login";


  static makePostRequest({apiUrl, data, token}) async {
    print(apiUrl);

    final uri = Uri.parse(apiUrl);
    final jsonString = json.encode(data);
    var headers;
    if (token != null) {
      headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      };
    } else {
      headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };
    }
    return await http.post(uri, body: jsonString, headers: headers);
  }

  static initialisePostRequest({data, required String url, access_token}) async {
    if (await InternetUtils.checkConnectivity()) {
      try {
        var response = await ApiDocs.makePostRequest(
            apiUrl: url, data: data, token: access_token);
        print(access_token);
        print(data);
        print(response.statusCode);
        print(response.body);

        if (ResponseHandling.isRequestSuccessful(response.statusCode)) {
          var body = jsonDecode(response.body);

          return body;
        } else {
          if (response.statusCode == 400) {
            showErrorSnackBar(
                'Oops!', 'Something went wrong, Kindly log in again');
            Get.back();
          } else {
            return ResponseHandling.handleError(response);
          }
        }
      } catch (e) {
        print('API Error' + e.toString());
        return e.toString();
      }
    } else {
      return 'Check your internet connection';
    }
  }
}
