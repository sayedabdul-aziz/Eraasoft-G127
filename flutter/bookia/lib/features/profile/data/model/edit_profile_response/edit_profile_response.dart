import 'package:bookia/features/auth/data/model/response/user_response/user.dart';

class EditProfileResponse {
  User? data;
  String? message;
  List<dynamic>? error;
  int? status;

  EditProfileResponse({this.data, this.message, this.error, this.status});

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) {
    return EditProfileResponse(
      data: json['data'] == null
          ? null
          : User.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data?.toJson(),
    'message': message,
    'error': error,
    'status': status,
  };
}
