import 'dart:developer';

import 'package:bookia/components/dialogs/loading_dialog.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:bookia/features/wishlist/presentation/widgets/empty_data_ui.dart';
import 'package:bookia/features/wishlist/presentation/widgets/wishlist_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit()..getWishlist(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Wishlist')),
        body: BlocConsumer<WishlistCubit, WishlistState>(
          listener: blocListener,
          builder: blocBuilder,
        ),
      ),
    );
  }

  void blocListener(BuildContext context, WishlistState state) {
    log('Wishlist state: $state');
    if (state is WishlistErrorState) {
      context.pop();
      showMainDialog(context, 'Something went wrong');
    } else if (state is RemovedFromWishlistState) {
      context.pop();
      showMainDialog(context, 'Removed from wishlist', DialogType.success);
    } else if (state is RemoveFromWishlistLoadingState) {
      showLoadingDialog(context);
    } else if (state is AddedToCartCartState) {
      context.pop();
      showMainDialog(context, 'Added to cart', DialogType.success);
    }
  }

  Widget blocBuilder(BuildContext context, WishlistState state) {
    var cubit = context.read<WishlistCubit>();

    if (cubit.wishlistResponse?.data?.data?.isEmpty == true) {
      return EmptyDataUi();
    }
    return WishlistBuilder(
      books: cubit.wishlistResponse?.data?.data ?? [],
      onRemove: (productId) {
        cubit.removeFromWishlist(productId);
      },
      onAddToCart: (productId) {
        cubit.addToCart(productId);
      },
    );
  }
}
