import 'package:bookia/core/constants/app_constants.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/core/services/shared_pref.dart';
import 'package:bookia/features/profile/data/model/edit_profile_params.dart';
import 'package:bookia/features/profile/data/model/edit_profile_response/edit_profile_response.dart';

class ProfileRepo {
  static Future<bool> logout() async {
    try {
      var response = await DioProvider.post(
        endpoint: AppConstants.logout,
        headers: {'Authorization': 'Bearer ${SharedPref.getUserToken()}'},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<EditProfileResponse?> editProfile(
    EditProfileParams params,
  ) async {
    try {
      var response = await DioProvider.post(
        endpoint: AppConstants.updateProfile,
        data: params.toFormData(),
        headers: {'Authorization': 'Bearer ${SharedPref.getUserToken()}'},
      );
      if (response.statusCode == 200) {
        return EditProfileResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
