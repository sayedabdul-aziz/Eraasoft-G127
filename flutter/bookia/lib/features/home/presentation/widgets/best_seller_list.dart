import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/extensions/navigation.dart';
import 'package:bookia/core/routers/routers.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/home/data/model/best_seller_response/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Best Seller', style: TextStyles.getHeadline2()),
          Gap(15),
          Skeletonizer(
            enabled: products.isEmpty,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.isEmpty ? 4 : products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 290,
              ),
              itemBuilder: (context, index) {
                if (products.isEmpty) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 290,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  );
                }
                return GestureDetector(
                  onTap: () {
                    context.pushTo(Routes.details, extra: products[index]);
                  },
                  child: Container(
                    padding: EdgeInsets.all(11),
                    decoration: BoxDecoration(
                      color: AppColors.primary50Color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Hero(
                            tag: products[index].id ?? '',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: products[index].image ?? '',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorWidget: (context, url, error) => Icon(
                                  Icons.error,
                                  color: AppColors.darkColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Gap(5),
                        SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${products[index].name}',
                                  // textAlign: TextAlign.left,
                                  style: TextStyles.getTitle(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${products[index].price}',
                              style: TextStyles.getBody(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            MainButton(
                              width: 80,
                              height: 30,
                              borderRadius: 5,
                              bgColor: AppColors.darkColor,
                              text: 'Buy',
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
