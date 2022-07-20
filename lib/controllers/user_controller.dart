import 'package:get/get.dart';
import 'package:momo/views/signup_screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class UserController extends GetxController {
  String token = '';
  String userId = '';
  String referralId = '';
  Profile? profile;
  Wallet? wallet;
  List<Loan>? loans = [];

  Profile? getProfile() => profile;

  Wallet? getWallet() => wallet;
  String? getToken() => token;

  setUserDetail(data) {
    Profile profile = Profile.fromJson(data);
    this.profile = profile;
  }

  setUserWallet(data) {
    Wallet wallet = Wallet.fromJson(data);
    this.wallet = wallet;
  }

  setToken(token) => this.token = token;

  setLoans(loans) => this.loans = loans;

  setUserId(userId) => this.userId = userId;

  setReferralId(referralId) => this.referralId = referralId;

  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    preferences.setBool("installed", true);
    Get.offAll(() => const LoginPage());
  }
}
