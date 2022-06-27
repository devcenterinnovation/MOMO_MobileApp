import 'api_docs.dart';

class AuthenticationService {
  static login(username, password) async {
    var data = {
      'username': username,
      'password': password,
    };

    return await ApiDocs.initialisePostRequest(
        url: ApiDocs.LOGIN_URL, data: data);
  }



  //
  // static loginSocial(email, userType) async {
  //   var data = {
  //     'email': email,
  //     'userType': userType,
  //   };
  //   print(data);
  //   return await ApiDocs.initialisePostRequest(url: ApiDocs.login, data: data);
  // }
  //
  // static registerSocial({email, fullName, userType, socialId, platform}) async {
  //   var data = {
  //     'fullname': fullName,
  //     'email': email,
  //     'socialId': socialId,
  //     'platform': platform,
  //     'userType': userType,
  //   };
  //   print(data);
  //   return await ApiDocs.initialisePostRequest(
  //       url: ApiDocs.register, data: data);
  // }
  //
  // static celebLogin(email, password) async {
  //   var data = {
  //     'email': email,
  //     'password': password,
  //   };
  //
  //   print(data);
  //   return await ApiDocs.initialisePostRequest(
  //       url: ApiDocs.loginCeleb, data: data);
  // }
  //
  // static resetPassword({confirmPassword, newPassword, required otp}) async {
  //   var data = {
  //     'new_password': newPassword,
  //     'confirm_password': confirmPassword,
  //   };
  //
  //   return await ApiDocs.initialisePostRequest(
  //       url: ApiDocs.resetPassword + '/$otp', data: data);
  // }
  //
  // static forgotPassword({email, receiveOption, phoneNumber}) async {
  //   var data = {
  //     'receiveOption': receiveOption,
  //     'phoneNumber': phoneNumber,
  //     'email': email,
  //   };
  //
  //   return await ApiDocs.initialisePostRequest(
  //       url: ApiDocs.forgotPassword, data: data);
  // }
  //
  // static verifyOtp({required String userId, required String otp}) async {
  //   return await ApiDocs.initialiseGetRequest(
  //       url: ApiDocs.verifyOtp +
  //           '?otp=$otp&userId=$userId&email=false&phone=true',
  //       token: null);
  // }
  //
  // static register({
  //   required String email,
  //   required String fullName,
  //   required String username,
  //   required String password,
  //   required String phoneNumber,
  //   required String birthday,
  // }) async {
  //   var data = {
  //     'fullname': fullName,
  //     'username': username,
  //     'email': email,
  //     'phoneNumber': phoneNumber,
  //     'password': password,
  //     'birthday': birthday
  //   };
  //
  //   print(data);
  //   return await ApiDocs.initialisePostRequest(
  //       url: ApiDocs.register, data: data);
  // }
  //
  // static registerCeleb({
  //   required String email,
  //   required String fullName,
  //   required String username,
  //   required String password,
  //   required String phoneNumber,
  //   required String social,
  //   required String handle,
  //   required String description,
  // }) async {
  //   var data = {
  //     'fullname': fullName,
  //     'username': username,
  //     'email': email,
  //     'phoneNumber': phoneNumber,
  //     'password': password,
  //     'socialMedia': social,
  //     'socialHandle': handle,
  //     'description': description,
  //   };
  //
  //   print(data);
  //   return await ApiDocs.initialisePostRequest(
  //       url: ApiDocs.registerCeleb, data: data, token: null);
  // }
  //
  // static saveUserNotificationId({
  //   required String device_id,
  //   required String token,
  // }) async {
  //   print('fan $device_id');
  //
  //   return await ApiDocs.initialisePostRequest(
  //       url: ApiDocs.saveUserNotificationId,
  //       token: token,
  //       data: {'playerId': device_id});
  // }
  //
  // static saveCelebNotificationId({
  //   required String device_id,
  //   required String token,
  // }) async {
  //   print('celeb $device_id');
  //
  //   return await ApiDocs.initialisePostRequest(
  //       url: ApiDocs.saveCelebNotificationId,
  //       token: token,
  //       data: {'playerId': device_id});
  // }
}
