import 'dart:async';

class InternetUtils {
  static final Duration _CONNECTIVITY_TIMEOUT = const Duration(seconds: 5);

  static Future<bool> checkConnectivity() async {
    return true;

    // try {
    //   ConnectivityResult conn = await Connectivity().checkConnectivity();
    //   if (conn != ConnectivityResult.wifi &&
    //       conn != ConnectivityResult.mobile) {
    //     return false;
    //   }
    //   final result = await InternetAddress.lookup('google.com')
    //       .timeout(_CONNECTIVITY_TIMEOUT);
    //   if (result.isNotEmpty && result.first.rawAddress.isNotEmpty == true) {
    //     return true;
    //   }
    // } catch (e) {
    //   return false;
    // }
    // return false;
  }
}
