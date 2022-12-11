// import 'package:fourth_pyramid_task2/core/models/status_model.dart';
// import 'package:fourth_pyramid_task2/feature/auth/data/models/user_model.dart';

// class LoginModel {
//   UserModel? user;
//   final int status;
//   final String massage;

//   LoginModel({
//     required this.status,
//     required this.massage,
//     this.user,
//   });
//   factory LoginModel.fromJson(Map<String, dynamic> json) {
//     if (json['status'] == 0) {
//       return LoginModel(
//         status: json['status'],
//         massage: json['massage'],
//       );
//     } else {
//       return LoginModel(
//         status: json['status'],
//         massage: json['massage'],
//         user: UserModel.fromJson(json['data']),
//       );
//     }
//   }
// }
