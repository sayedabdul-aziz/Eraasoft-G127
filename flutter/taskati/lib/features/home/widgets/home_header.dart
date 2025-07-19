import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/profile/profile_screen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${LocalStorage.getData(LocalStorage.name)}',
              style: TextStyles.getTitleTextStyle(),
            ),
            Text('Have a nice day',
                style: TextStyles.getBodyTextStyle(
                  context,
                )),
          ],
        ),
        GestureDetector(
          onTap: () {
            context.pushTo(const ProfileScreen());
          },
          child: CircleAvatar(
            radius: 25,
            backgroundImage:
                FileImage(File(LocalStorage.getData(LocalStorage.image))),
          ),
        )
      ],
    );
  }
}
