import 'package:bookia/core/constants/app_constants.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/features/home/data/model/best_seller_response/best_seller_response.dart';
import 'package:bookia/features/home/data/model/slider_response/slider_response.dart';

class HomeRepo {
  static Future<SliderResponse?> getSlider() async {
    try {
      var response = await DioProvider.get(endpoint: AppConstants.sliders);
      if (response.statusCode == 200) {
        return SliderResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }

  static Future<BestSellerResponse?> getBestSeller() async {
    try {
      var response = await DioProvider.get(endpoint: AppConstants.bestSeller);
      if (response.statusCode == 200) {
        return BestSellerResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }
}
