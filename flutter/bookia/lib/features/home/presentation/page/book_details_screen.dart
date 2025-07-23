import 'package:bookia/components/app_bar/main_app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/dialogs/loading_dialog.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/home/data/model/best_seller_response/product.dart';
import 'package:bookia/features/home/presentation/cubit/home_bloc.dart';
import 'package:bookia/features/home/presentation/cubit/home_event.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is AddedToWishlistCartState) {
            context.pop();
            showMainDialog(context, state.message, DialogType.success);
          } else if (state is HomeErrorState) {
            context.pop();
            showMainDialog(context, 'Something went wrong');
          } else if (state is HomeLoadingState) {
            showLoadingDialog(context);
          }
        },
        builder: (context, state) => Scaffold(
          appBar: MainAppBarWithBack(
            action: IconButton(
              onPressed: () {
                context.read<HomeBloc>().add(
                  AddToWishlistEvent(productId: product.id ?? 0),
                );
              },
              icon: SvgPicture.asset(AppAssets.bookmarkSvg),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Gap(30),
                    Hero(
                      tag: product.id ?? '',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: product.image ?? '',
                          fit: BoxFit.cover,
                          width: 200,
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error, color: AppColors.darkColor),
                        ),
                      ),
                    ),
                    Gap(15),
                    Text(
                      '${product.name}',
                      textAlign: TextAlign.center,
                      style: TextStyles.getHeadline1(),
                    ),
                    Gap(10),
                    Text(
                      product.category ?? '',
                      style: TextStyles.getBody(color: AppColors.primaryColor),
                    ),
                    Gap(15),
                    Text(
                      'ldsfhgldsfhgsefg dslkgnjdflsdslkgnjdflsdslkgnjdflsdslkgnjdflsdslkgnjdfls;kgndfkslg dflkgndflg;n dfgdflglkdfg gdf,gndf,sngds,fngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsffngdsfngdlfdngfgdsf ;lgndfsljgbdsflgbdfdfgndlfgdflgnldkfsgdf dfkgndfksngdf;gndlfgdf',
                      style: TextStyles.getSmall(color: AppColors.darkColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${product.price}', style: TextStyles.getHeadline2()),
                  Gap(30),
                  Expanded(
                    child: MainButton(
                      borderRadius: 5,
                      bgColor: AppColors.darkColor,
                      text: 'Add To Cart',
                      onPressed: () {
                        context.read<HomeBloc>().add(
                          AddToCartEvent(productId: product.id ?? 0),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
