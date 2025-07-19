import 'dart:io';

import 'package:dio/dio.dart';

class EditProfileParams {
  String? name;
  String? address;
  String? phone;
  File? image;

  EditProfileParams({this.name, this.address, this.phone});

  factory EditProfileParams.fromJson(Map<String, dynamic> json) {
    return EditProfileParams(
      name: json['name'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'address': address,
    'phone': phone,
  };

  FormData toFormData() {
    final formData = <String, dynamic>{};
    if (name != null) formData['name'] = name;
    if (address != null) formData['address'] = address;
    if (phone != null) formData['phone'] = phone;
    if (image != null) {
      formData['image'] = MultipartFile.fromFile(
        image!.path,
        filename: image!.path.split('/').last, // A/b/info/user.png
      );
    }
    return FormData.fromMap(formData);
  }
}
