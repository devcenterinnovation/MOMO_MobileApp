//
//
// class User {
//   User({
//     required this.id,
//     required this.password,
//     required this.phone,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.profile,
//     required this.wallet,
//   });
//
//   String id;
//   String password;
//   String phone;
//   DateTime createdAt;
//   DateTime updatedAt;
//   Profile profile;
//   Wallet wallet;
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     id: json["id"],
//     password: json["password"],
//     phone: json["phone"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     profile: Profile.fromJson(json["profile"]),
//     wallet: Wallet.fromJson(json["wallet"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "password": password,
//     "phone": phone,
//     "createdAt": createdAt.toIso8601String(),
//     "updatedAt": updatedAt.toIso8601String(),
//     "profile": profile.toJson(),
//     "wallet": wallet.toJson(),
//   };
// }
//
// class Profile {
//   Profile({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.middleName,
//     this.email,
//     this.address,
//     this.phone,
//     this.gender,
//     this.maritalStatus,
//     this.children,
//     this.education,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   String id;
//   String firstName;
//   String lastName;
//   String middleName;
//   String email;
//   String address;
//   String phone;
//   String gender;
//   String maritalStatus;
//   int children;
//   String education;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory Profile.fromJson(Map<String, dynamic> json) => Profile(
//     id: json["id"],
//     firstName: json["first_name"],
//     lastName: json["last_name"],
//     middleName: json["middle_name"],
//     email: json["email"],
//     address: json["address"],
//     phone: json["phone"],
//     gender: json["gender"],
//     maritalStatus: json["marital_status"],
//     children: json["children"],
//     education: json["education"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "first_name": firstName,
//     "last_name": lastName,
//     "middle_name": middleName,
//     "email": email,
//     "address": address,
//     "phone": phone,
//     "gender": gender,
//     "marital_status": maritalStatus,
//     "children": children,
//     "education": education,
//     "createdAt": createdAt.toIso8601String(),
//     "updatedAt": updatedAt.toIso8601String(),
//   };
// }
//
// class Wallet {
//   Wallet({
//     this.id,
//     this.status,
//     this.balance,
//   });
//
//   String id;
//   bool status;
//   int balance;
//
//   factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
//     id: json["id"],
//     status: json["status"],
//     balance: json["balance"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "status": status,
//     "balance": balance,
//   };
// }
