import 'package:bookia/core/services/shared_pref.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var userInfo = SharedPref.getUserInfo();
    return Row(
      children: [
        if (userInfo?.image?.isNotEmpty == true)
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: userInfo?.image ?? '',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userInfo?.name ?? 'Guest User',
                style: TextStyles.getTitle(),
              ),
              const SizedBox(height: 8),
              Text(
                userInfo?.email ?? 'No email provided',
                style: TextStyles.getSmall(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
