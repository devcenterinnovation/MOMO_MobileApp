import 'dart:convert';

otp otpFromJson(String str) => otp.fromJson(json.decode(str));

String otpToJson(otp data) => json.encode(data.toJson());

class otp {
  otp({
    this.status,
    required this.message,
    required this.data,
  });

  bool? status;
  String message;
  Data data;

  factory otp.fromJson(Map<String, dynamic> json) => otp(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.sender,
    this.reference,
    this.destination,
    required this.otp,
    this.channel,
    this.expiresAt,
  });

  String? sender;
  String? reference;
  String? destination;
  String otp;
  String? channel;
  DateTime? expiresAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sender: json["sender"],
        reference: json["reference"],
        destination: json["destination"],
        otp: json["otp"],
        channel: json["channel"],
        expiresAt: DateTime.parse(json["expires_at"]),
      );

  Map<String, dynamic> toJson() => {
        "sender": sender,
        "reference": reference,
        "destination": destination,
        "otp": otp,
        "channel": channel,
        "expires_at": expiresAt!.toIso8601String(),
      };
}
