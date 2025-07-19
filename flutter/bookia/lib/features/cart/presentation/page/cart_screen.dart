import 'dart:developer';

import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/dialogs/loading_dialog.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_state.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_builder.dart';
import 'package:bookia/features/cart/presentation/widgets/empty_data_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Cart')),
        body: BlocConsumer<CartCubit, CartState>(
          listener: blocListener,
          builder: blocBuilder,
        ),
      ),
    );
  }

  void blocListener(BuildContext context, CartState state) {
    if (state is CartErrorState) {
      context.pop();
      showMainDialog(context, 'Something went wrong');
    } else if (state is RemovedFromCartState) {
      context.pop();
      showMainDialog(context, 'Removed from Cart', DialogType.success);
    } else if (state is RemoveFromCartLoadingState) {
      showLoadingDialog(context);
    } else if (state is CartUpdatedState) {
      context.pop();
    } else if (state is CheckoutOrderDoneState) {
      log('Checkout successful');
    }
  }

  Widget blocBuilder(BuildContext context, CartState state) {
    var cubit = context.read<CartCubit>();
    if (cubit.cartResponse?.data?.cartItems?.isEmpty == true) {
      return EmptyCartUi();
    }
    return Column(
      children: [
        Expanded(
          child: CartBuilder(
            books: cubit.cartResponse?.data?.cartItems ?? [],
            onRemove: (productId) {
              cubit.removeFromCart(productId);
            },
            onUpdateCart: (updateParams) {
              cubit.updateCart(updateParams);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: TextStyles.getTitle()),
                  Text(
                    '${cubit.cartResponse?.data?.total ?? 0}',
                    style: TextStyles.getTitle(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              MainButton(
                text: 'Checkout',
                onPressed: () {
                  cubit.checkoutOrder();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
