import 'dart:convert';

import 'package:http/http.dart' as http;

class ResponseHandling {
  static isRequestSuccessful(int? statusCode) {
    return statusCode! >= 200 && statusCode < 300;
  }

  static handleError(http.Response response) {
    print(response.body);
    print(response.statusCode);

    switch (response.statusCode) {
      case 400:
        throw (jsonDecode(response.body)['message']);

      case 401:
        throw 'Unauthorized - ${jsonDecode(response.body)['message']}';

      case 403:
        throw 'Forbidden - ${jsonDecode(response.body)['message']}';

      case 422:
        throw 'Unable to process - ${jsonDecode(response.body)['message']}';

      case 500:
        throw 'Server - ${jsonDecode(response.body)['message']}';
      default:
        throw 'Error occurred with code : ${response.statusCode} ${response.request!.url} ${response.body}';
    }
  }
}
