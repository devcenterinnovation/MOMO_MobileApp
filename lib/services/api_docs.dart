import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:momo/dialogs_snackbar.dart';
import 'package:momo/services/internet_services.dart';
import 'package:momo/services/response_handling.dart';

class ApiDocs {
  static String BASE_URL = "https://momo-app-prdo9.ondigitalocean.app/";

  static String LOGIN_URL = BASE_URL + "auth/login";

  static String SIGNUP_URL = BASE_URL + "users";

  static String GETUSER_URL = BASE_URL + "users/";

  static String LOAN_URL = BASE_URL + "users/loan";

  static String GET_LOAN_URL = BASE_URL + "users";

  static String OTP = BASE_URL + "users/otp";

  static makePostRequest({apiUrl, data, access_token}) async {
    final uri = Uri.parse(apiUrl);
    final jsonString = json.encode(data);
    var headers;
    if (access_token != null) {
      headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.cookieHeader: 'jwt=$access_token',
        HttpHeaders.authorizationHeader: 'Bearer $access_token',
      };
    } else {
      headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };
    }
    return await http.post(uri, body: jsonString, headers: headers);
  }

  static makePatchRequest({apiUrl, data, access_token}) async {
    print(apiUrl);

    final uri = Uri.parse(apiUrl);
    final jsonString = json.encode(data);
    var headers;
    if (access_token != null) {
      headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $access_token',
        HttpHeaders.cookieHeader: 'jwt=$access_token',
      };
    } else {
      headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };
    }
    return await http.patch(uri, body: jsonString, headers: headers);
  }

  static makeGetRequest({apiUrl, access_token}) async {
    print(apiUrl);
    print(access_token);

    final uri = Uri.parse(apiUrl);
    var headers;
    if (access_token != null) {
      headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $access_token',
        HttpHeaders.cookieHeader: 'jwt=$access_token'
      };
    } else {
      headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };
    }
    return await http.get(uri, headers: headers);
  }

  static initialisePostRequest(
      {data, required String url, token, isLogin}) async {
    if (await InternetUtils.checkConnectivity()) {
      try {
        var response = await ApiDocs.makePostRequest(
            apiUrl: url, access_token: token, data: data);

        if (ResponseHandling.isRequestSuccessful(response.statusCode)) {
          var body = jsonDecode(response.body);

          if (isLogin == true) {
            body['token'] = response.headers['set-cookie']
                .toString()
                .split('jwt=')[1]
                .split(';')[0]
                .replaceAll(' ', '');
          }

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

  // static initialisePatchRequest({data, required String url, access_token}) async {
  //   if (await InternetUtils.checkConnectivity()) {
  //     try {
  //       var response = await ApiDocs.makePatchRequest(
  //           apiUrl: url, data: data, token: access_token);
  //       print(access_token);
  //       print(data);
  //       print(response.statusCode);
  //       print(response.body);
  //
  //       if (ResponseHandling.isRequestSuccessful(response.statusCode)) {
  //         var body = jsonDecode(response.body);
  //
  //         return body;
  //       } else {
  //         if (response.statusCode == 400) {
  //           showErrorSnackBar(
  //               'Oops!', 'Something went wrong, Kindly log in again');
  //           Get.back();
  //         } else {
  //           return ResponseHandling.handleError(response);
  //         }
  //       }
  //     } catch (e) {
  //       print('API Error' + e.toString());
  //       return e.toString();
  //     }
  //   } else {
  //     return 'Check your internet connection';
  //   }
  // }

  static initialiseGetRequest(token, {required String url}) async {
    if (await InternetUtils.checkConnectivity()) {
      try {
        var response =
            await ApiDocs.makeGetRequest(apiUrl: url, access_token: token);

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
