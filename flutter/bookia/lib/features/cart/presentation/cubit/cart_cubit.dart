import 'package:bookia/features/cart/data/model/get_cart_response/get_cart_response.dart';
import 'package:bookia/features/cart/data/model/update_cart_params.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  GetCartResponse? cartResponse = GetCartResponse();

  Future<void> getCart() async {
    emit(CartLoadingState());
    CartRepo.getCart().then((value) {
      if (value != null) {
        cartResponse = value;
        emit(CartSuccessState());
      } else {
        emit(CartErrorState());
      }
    });
  }

  Future<void> removeFromCart(int cartItemId) async {
    emit(RemoveFromCartLoadingState());
    CartRepo.removeFromCart(cartItemId).then((value) {
      if (value != null) {
        cartResponse = value;
        emit(RemovedFromCartState());
      } else {
        emit(CartErrorState());
      }
    });
  }

  Future<void> updateCart(UpdateCartParams params) async {
    emit(RemoveFromCartLoadingState());
    CartRepo.updateCart(params).then((value) {
      if (value != null) {
        cartResponse = value;
        emit(CartUpdatedState());
      } else {
        emit(CartErrorState());
      }
    });
  }

  Future<void> checkoutOrder() async {
    emit(RemoveFromCartLoadingState());
    CartRepo.checkoutOrder().then((value) {
      if (value) {
        emit(CheckoutOrderDoneState());
      } else {
        emit(CartErrorState());
      }
    });
  }
}
