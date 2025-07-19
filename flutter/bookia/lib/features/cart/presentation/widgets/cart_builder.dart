import 'package:bookia/components/dialogs/loading_dialog.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/cart/data/model/get_cart_response/cart_item.dart';
import 'package:bookia/features/cart/data/model/update_cart_params.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CartBuilder extends StatelessWidget {
  const CartBuilder({
    super.key,
    required this.books,
    required this.onRemove,
    required this.onUpdateCart,
  });

  final List<CartItem> books;
  final Function(int) onRemove;
  final Function(UpdateCartParams) onUpdateCart;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: books.length,
      padding: const EdgeInsets.all(20),
      separatorBuilder: (BuildContext context, int index) {
        return Gap(20);
      },
      itemBuilder: (BuildContext context, int index) {
        var book = books[index];
        return Row(
          children: [
            Hero(
              tag: index,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: book.itemProductImage ?? '',
                  fit: BoxFit.cover,
                  width: 100,
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, color: AppColors.darkColor),
                ),
              ),
            ),
            Gap(20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          book.itemProductName ?? 'Unknown Book',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.getTitle(),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          onRemove(book.itemId ?? 0);
                        },
                        icon: SvgPicture.asset(AppAssets.closeSvg),
                        color: AppColors.darkColor,
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    children: [
                      Text(
                        '\$${book.itemProductPriceAfterDiscount}',
                        style: TextStyles.getBody(),
                      ),
                      // if (book.itemProductDiscount != null &&
                      //     book.itemProductDiscount != 0) ...[
                      Visibility(
                        visible:
                            (book.itemProductDiscount != null &&
                            book.itemProductDiscount != 0),
                        child: Row(
                          children: [
                            Gap(10),
                            Text(
                              '${book.itemProductPrice ?? 0}',
                              style:
                                  TextStyles.getBody(
                                    color: AppColors.greyColor,
                                  ).copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: AppColors.darkColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    // ],
                  ),
                  Gap(10),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (((book.itemQuantity ?? 0) + 1) <=
                              (book.itemProductStock ?? 1)) {
                            onUpdateCart(
                              UpdateCartParams(
                                cartItemId: book.itemId ?? 0,
                                quantity: (book.itemQuantity ?? 0) + 1,
                              ),
                            );
                          } else {
                            showMainDialog(
                              context,
                              'Quantity cannot be more than ${book.itemProductStock}',
                              DialogType.error,
                            );
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.accentColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(Icons.add),
                        ),
                      ),
                      Gap(8),
                      SizedBox(
                        width: 20,
                        child: Text(
                          '${book.itemQuantity}',
                          textAlign: TextAlign.center,
                          style: TextStyles.getBody(),
                        ),
                      ),
                      Gap(8),
                      GestureDetector(
                        onTap: () {
                          if (((book.itemQuantity ?? 0) - 1) > 1) {
                            onUpdateCart(
                              UpdateCartParams(
                                cartItemId: book.itemId ?? 0,
                                quantity: (book.itemQuantity ?? 0) - 1,
                              ),
                            );
                          } else {
                            showMainDialog(
                              context,
                              'Quantity cannot be less than 1',
                              DialogType.error,
                            );
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.accentColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(Icons.remove),
                        ),
                      ),
                      Spacer(),
                      Text(
                        '\$${book.itemTotal?.toStringAsFixed(1)}',
                        style: TextStyles.getTitle(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
