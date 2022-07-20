// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    this.password,
    required this.phone,
    this.referralId,
    this.referredBy,
    this.createdAt,
    this.updatedAt,
    required this.profile,
    required this.wallet,
    required this.loans,
  });

  String id;
  String? password;
  String phone;
  dynamic referralId;
  String? referredBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  Profile profile;
  Wallet wallet;
  List<Loan> loans;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        password: json["password"],
        phone: json["phone"],
        referralId: json["referral_id"],
        referredBy: json["referred_by"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        profile: Profile.fromJson(json["profile"]),
        wallet: Wallet.fromJson(json["wallet"]),
        loans: List<Loan>.from(json["loans"].map((x) => Loan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "phone": phone,
        "referralID": referralId,
        "referredBy": referredBy,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "profile": profile.toJson(),
        "wallet": wallet.toJson(),
        "loans": List<dynamic>.from(loans.map((x) => x.toJson())),
      };
}

class Loan {
  Loan({
    this.id,
    required this.amount,
    required this.amountDisbursed,
    required this.serviceCharge,
    required this.repaymentAmount,
    this.interest,
    required this.term,
    required this.status,
    required this.remark,
    this.createdAt,
    this.updatedAt,
    this.disbursementDate,
    required this.repaymentDate,
    required this.purpose,
    required this.repaid,
  });

  String? id;
  int amount;
  int amountDisbursed;
  int serviceCharge;
  int repaymentAmount;
  int? interest;
  int term;
  String status;
  String remark;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic disbursementDate;
  String repaymentDate;
  String purpose;
  bool repaid;

  factory Loan.fromJson(Map<String, dynamic> json) => Loan(
        id: json["id"],
        amount: json["amount"],
        amountDisbursed: json["amount_disbursed"],
        serviceCharge: json["service_charge"],
        repaymentAmount: json["repayment_amount"],
        interest: json["interest"],
        term: json["term"],
        status: json["status"],
        remark: json["remark"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        disbursementDate: json["disbursement_date"],
        repaymentDate: json["repayment_date"],
        purpose: json["purpose"],
        repaid: json["repaid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "amount_disbursed": amountDisbursed,
        "service_charge": serviceCharge,
        "repayment_amount": repaymentAmount,
        "interest": interest,
        "term": term,
        "status": status,
        "remark": remark,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "disbursement_date": disbursementDate,
        "repayment_date": repaymentDate,
        "purpose": purpose,
        "repaid": repaid,
      };
}

class Profile {
  Profile({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    this.email,
    this.address,
    required this.addressDetails,
    this.phone,
    required this.dob,
    required this.nationality,
    required this.bvn,
    required this.gender,
    this.maritalStatus,
    this.children,
    this.education,
    this.employed,
    this.company,
    required this.bankDetails,
    this.createdAt,
    this.updatedAt,
    required this.profilePicture,
    this.guarantors,
    this.referrals,
  });

  String? id;
  String firstName;
  String lastName;
  String middleName;
  String? email;
  String? address;
  String addressDetails;
  String? phone;
  String dob;
  String nationality;
  String bvn;
  String gender;
  String? maritalStatus;
  int? children;
  String? education;
  bool? employed;
  Company? company;
  BankDetails bankDetails;
  String profilePicture;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Guarantor>? guarantors;
  List<dynamic>? referrals;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        middleName: json["middle_name"],
        email: json["email"],
        address: json["address"],
        addressDetails: json["address_details"],
        phone: json["phone"],
        dob: json["dob"],
        nationality: json["nationality"],
        bvn: json["bvn"],
        gender: json["gender"],
        maritalStatus: json["marital_status"],
        children: json["children"],
        education: json["education"],
        employed: json["employed"],
        company: Company.fromJson(json["company"]),
        bankDetails: BankDetails.fromJson(json["bank_details"]),
        profilePicture: json["profile_picture"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        guarantors: List<Guarantor>.from(
            json["guarantors"].map((x) => Guarantor.fromJson(x))),
        referrals: List<dynamic>.from(json["referrals"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "middle_name": middleName,
        "email": email,
        "address": address,
        "address_details": addressDetails,
        "phone": phone,
        "dob": dob,
        "nationality": nationality,
        "bvn": bvn,
        "gender": gender,
        "marital_status": maritalStatus,
        "children": children,
        "education": education,
        "employed": employed,
        "company": company!.toJson(),
        "bank_details": bankDetails.toJson(),
        "profile_picture": profilePicture,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "guarantors": List<dynamic>.from(guarantors!.map((x) => x.toJson())),
        "referrals": List<dynamic>.from(referrals!.map((x) => x)),
      };
}

class BankDetails {
  BankDetails({
    required this.bankName,
    required this.accountName,
    required this.accountNumber,
  });

  String bankName;
  String accountName;
  String accountNumber;

  factory BankDetails.fromJson(Map<String, dynamic> json) => BankDetails(
        bankName: json["bank_name"],
        accountName: json["account_name"],
        accountNumber: json["account_number"],
      );

  Map<String, dynamic> toJson() => {
        "bank_name": bankName,
        "account_name": accountName,
        "account_number": accountNumber,
      };
}

class Company {
  Company({
    this.companyName,
    this.companyLocation,
    this.companyRole,
    this.duration,
    this.salary,
  });

  String? companyName;
  String? companyLocation;
  String? companyRole;
  String? duration;
  String? salary;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        companyName: json["company_name"],
        companyLocation: json["company_location"],
        companyRole: json["company_role"],
        duration: json["duration"],
        salary: json["salary"],
      );

  Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "company_location": companyLocation,
        "company_role": companyRole,
        "duration": duration,
        "salary": salary,
      };
}

class Guarantor {
  Guarantor({
    this.id,
    this.relationship,
    this.name,
    this.phone,
  });

  String? id;
  String? relationship;
  String? name;
  String? phone;

  factory Guarantor.fromJson(Map<String, dynamic> json) => Guarantor(
        id: json["id"],
        relationship: json["relationship"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "relationship": relationship,
        "name": name,
        "phone": phone,
      };
}

class Wallet {
  Wallet({
    this.id,
    this.status,
    this.balance,
    this.maxBalance,
  });

  String? id;
  bool? status;
  int? balance;
  int? maxBalance;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json["id"],
        status: json["status"],
        balance: json["balance"],
        maxBalance: json["maxBalance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "balance": balance,
        "maxBalance": maxBalance,
      };
}
