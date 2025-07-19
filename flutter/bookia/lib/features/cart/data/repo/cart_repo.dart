import 'package:bookia/core/constants/app_constants.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/core/services/shared_pref.dart';
import 'package:bookia/features/cart/data/model/get_cart_response/get_cart_response.dart';
import 'package:bookia/features/cart/data/model/update_cart_params.dart';

class CartRepo {
  static Future<GetCartResponse?> getCart() async {
    try {
      var response = await DioProvider.get(
        endpoint: AppConstants.cart,
        headers: {'Authorization': 'Bearer ${SharedPref.getUserToken()}'},
      );
      if (response.statusCode == 200) {
        return GetCartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }

  static Future<bool> addToCart(int productId) async {
    try {
      var response = await DioProvider.post(
        endpoint: AppConstants.addToCart,
        data: {"product_id": productId},
        headers: {'Authorization': 'Bearer ${SharedPref.getUserToken()}'},
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }
  }

  static Future<GetCartResponse?> removeFromCart(int cartItemId) async {
    try {
      var response = await DioProvider.post(
        endpoint: AppConstants.removeFromCart,
        data: {"cart_item_id": cartItemId},
        headers: {'Authorization': 'Bearer ${SharedPref.getUserToken()}'},
      );
      if (response.statusCode == 200) {
        return GetCartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }

  static Future<GetCartResponse?> updateCart(UpdateCartParams params) async {
    try {
      var response = await DioProvider.post(
        endpoint: AppConstants.updateCart,
        data: params.toJson(),
        headers: {'Authorization': 'Bearer ${SharedPref.getUserToken()}'},
      );
      if (response.statusCode == 201) {
        return GetCartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }

  static Future<bool> checkoutOrder() async {
    try {
      var response = await DioProvider.get(
        endpoint: AppConstants.checkout,
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
}
