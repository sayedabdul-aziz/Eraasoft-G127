import 'package:bookia/core/constants/app_constants.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/core/services/shared_pref.dart';
import 'package:bookia/features/wishlist/data/model/get_wishlist_response/get_wishlist_response.dart';

class WishlistRepo {
  static Future<GetWishlistResponse?> getWishlist() async {
    try {
      var response = await DioProvider.get(
        endpoint: AppConstants.wishlist,
        headers: {'Authorization': 'Bearer ${SharedPref.getUserToken()}'},
      );
      if (response.statusCode == 200) {
        return GetWishlistResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }

  static Future<bool> addToWishlist(int productId) async {
    try {
      var response = await DioProvider.post(
        endpoint: AppConstants.addToWishlist,
        data: {"product_id": productId},
        headers: {'Authorization': 'Bearer ${SharedPref.getUserToken()}'},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }
  }

  static Future<GetWishlistResponse?> removeFromWishlist(int productId) async {
    try {
      var response = await DioProvider.post(
        endpoint: AppConstants.removeFromWishlist,
        data: {"product_id": productId},
        headers: {'Authorization': 'Bearer ${SharedPref.getUserToken()}'},
      );
      if (response.statusCode == 200) {
        return GetWishlistResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }
}
