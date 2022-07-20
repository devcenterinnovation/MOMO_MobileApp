import 'package:get/get.dart';
import 'package:momo/models/otp_modell.dart';

class OTPController extends GetxController {
  Data? data;

  Data? getData() => data;

  setOTP(otp) {
    Data data = Data.fromJson(otp);
    this.data = data;
  }
}
