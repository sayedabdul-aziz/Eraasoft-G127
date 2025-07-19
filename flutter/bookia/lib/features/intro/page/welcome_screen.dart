import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/extensions/media_query.dart';
import 'package:bookia/core/extensions/navigation.dart';
import 'package:bookia/core/routers/routers.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.welcomeBg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                children: [
                  Gap(context.height * 0.15),
                  SvgPicture.asset(
                    AppAssets.logoSvg,
                    width: context.width * 0.55,
                  ),
                  Gap(10),
                  Text('Order Your Book Now!', style: TextStyles.getTitle()),
                  Spacer(),
                  MainButton(
                    text: 'Login',
                    onPressed: () {
                      context.pushTo(Routes.login);
                    },
                  ),
                  Gap(15),
                  MainButton(
                    text: 'Register',
                    bgColor: AppColors.whiteColor,
                    textColor: AppColors.darkColor,
                    borderColor: AppColors.darkColor,
                    onPressed: () {
                      context.pushTo(Routes.register);
                    },
                  ),
                  Gap(context.height * 0.1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//var map = {
//     "data": {
//         "user": {
//             "id": 1205,
//             "name": "Sayed",
//             "email": "sayed999@gmail.com",
//             "address": null,
//             "city": null,
//             "phone": null,
//             "email_verified": true,
//             "image": "https://codingarabic.online/admin/assets/img/default/user.jpg"
//         },
//         "token": "7460|cUgPHzPdgARVB00demWhp2bSPJDTVzcVrrU09JMU"
//     },
//     "message": "Successfully registered! Please verify your email.",
//     "error": [],
//     "status": 201
// }

// map["data"]["user"]["name"]

// userModel.data.user
