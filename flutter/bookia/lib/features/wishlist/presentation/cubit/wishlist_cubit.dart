import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/wishlist/data/model/get_wishlist_response/get_wishlist_response.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  GetWishlistResponse? wishlistResponse = GetWishlistResponse();

  Future<void> getWishlist() async {
    emit(WishlistLoadingState());
    WishlistRepo.getWishlist().then((value) {
      if (value != null) {
        wishlistResponse = value;
        emit(WishlistSuccessState());
      } else {
        emit(WishlistErrorState());
      }
    });
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(RemoveFromWishlistLoadingState());
    WishlistRepo.removeFromWishlist(productId).then((value) {
      if (value != null) {
        wishlistResponse = value;

        emit(RemovedFromWishlistState());
      } else {
        emit(WishlistErrorState());
      }
    });
  }

  Future<void> addToCart(int productId) async {
    emit(RemoveFromWishlistLoadingState());
    try {
      var response = await CartRepo.addToCart(productId);
      if (response) {
        emit(AddedToCartCartState());
      } else {
        emit(WishlistErrorState());
      }
    } on Exception catch (_) {
      emit(WishlistErrorState());
    }
  }
}
