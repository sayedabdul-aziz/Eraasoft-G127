import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/extensions/navigation.dart';
import 'package:bookia/core/routers/routers.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/home/data/model/best_seller_response/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WishlistBuilder extends StatelessWidget {
  const WishlistBuilder({
    super.key,
    required this.books,
    required this.onRemove,
    required this.onAddToCart,
  });

  final List<Product> books;
  final Function(int) onRemove;
  final Function(int) onAddToCart;

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
        return GestureDetector(
          onTap: () {
            context.pushTo(Routes.details, extra: book);
          },
          child: Row(
            children: [
              Hero(
                tag: index,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: book.image ?? '',
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
                            book.name ?? 'Unknown Book',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.getTitle(),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            onRemove(book.id ?? 0);
                          },
                          icon: SvgPicture.asset(AppAssets.closeSvg),
                          color: AppColors.darkColor,
                        ),
                      ],
                    ),
                    Gap(10),
                    Text('\$${book.price}', style: TextStyles.getBody()),
                    Gap(10),
                    MainButton(
                      width: 250,
                      height: 40,
                      borderRadius: 5,
                      text: 'Add to Cart',
                      onPressed: () {
                        onAddToCart(book.id ?? 0);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
