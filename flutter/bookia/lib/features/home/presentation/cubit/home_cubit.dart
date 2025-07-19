import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/home/data/model/best_seller_response/best_seller_response.dart';
import 'package:bookia/features/home/data/model/best_seller_response/product.dart';
import 'package:bookia/features/home/data/model/slider_response/slider.dart';
import 'package:bookia/features/home/data/model/slider_response/slider_response.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<SliderModel> sliders = [];

  List<Product> bestSellers = [];

  getHomeData() async {
    emit(HomeLoadingState());
    // call 2 apis in parallel
    try {
      var futures = await Future.value([
        HomeRepo.getSlider(), //300 ms
        HomeRepo.getBestSeller(), // 500 ms
      ]);

      sliders = ((await futures[0]) as SliderResponse).data?.sliders ?? [];
      bestSellers =
          ((await futures[1]) as BestSellerResponse).data?.products ?? [];

      emit(HomeSuccessState());
    } on Exception catch (_) {
      emit(HomeErrorState());
    }
  }

  Future<void> addToWishlist(int productId) async {
    emit(HomeLoadingState());
    try {
      var response = await WishlistRepo.addToWishlist(productId);
      if (response) {
        emit(AddedToWishlistCartState(message: 'Added to Wishlist'));
      } else {
        emit(HomeErrorState());
      }
    } on Exception catch (_) {
      emit(HomeErrorState());
    }
  }

  Future<void> addToCart(int productId) async {
    emit(HomeLoadingState());
    try {
      var response = await CartRepo.addToCart(productId);
      if (response) {
        emit(AddedToWishlistCartState(message: 'Added to Cart'));
      } else {
        emit(HomeErrorState());
      }
    } on Exception catch (_) {
      emit(HomeErrorState());
    }
  }
}
