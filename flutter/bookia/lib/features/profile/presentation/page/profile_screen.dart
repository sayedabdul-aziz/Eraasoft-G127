import 'package:bookia/components/dialogs/loading_dialog.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/extensions/navigation.dart';
import 'package:bookia/core/routers/routers.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_state.dart';
import 'package:bookia/features/profile/presentation/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is LogoutSuccessState) {
            context.pop();
            context.pushToBase(Routes.login);
          } else if (state is ProfileErrorState) {
            context.pop();
            showMainDialog(context, 'Something went wrong');
          } else if (state is ProfileLoadingState) {
            showLoadingDialog(context);
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
            actions: [
              IconButton(
                onPressed: () {
                  context.read<ProfileCubit>().logout();
                },
                icon: SvgPicture.asset(AppAssets.logoutSvg),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ProfileHeader(),
                const SizedBox(height: 20),
                Column(
                  children: [
                    ProfileTile(
                      label: 'Edit Profile',
                      onTap: () {
                        context.pushTo(Routes.editProfile);
                      },
                    ),
                    ProfileTile(label: 'Edit Profile', onTap: () {}),
                    ProfileTile(label: 'Edit Profile', onTap: () {}),
                    ProfileTile(label: 'Edit Profile', onTap: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key, required this.label, required this.onTap});

  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xff8A959E).withValues(alpha: 0.2),
              blurRadius: 40,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios, size: 20),
          ],
        ),
      ),
    );
  }
}
