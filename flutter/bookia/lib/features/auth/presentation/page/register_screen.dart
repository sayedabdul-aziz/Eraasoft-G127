import 'package:bookia/components/buttons/main_back_button.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/dialogs/loading_dialog.dart';
import 'package:bookia/components/inputs/name_text_form_field.dart';
import 'package:bookia/core/extensions/navigation.dart';
import 'package:bookia/core/extensions/validation.dart';
import 'package:bookia/core/routers/routers.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            // push to home
            context.pushToBase(Routes.main);
          } else if (state is AuthErrorState) {
            // show error
            context.pop();
            showMainDialog(context, 'Something went wrong');
          } else if (state is AuthLoadingState) {
            // show loading
            showLoadingDialog(context);
          }
        },
        builder: (context, state) {
          var cubit = context.read<AuthCubit>();
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: MainBackButton(),
            ),
            bottomNavigationBar: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?', style: TextStyles.getBody()),
                  TextButton(
                    onPressed: () {
                      context.pushWithReplacement(Routes.login);
                    },
                    child: Text(
                      'Login Now',
                      style: TextStyles.getBody(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(22),
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      Text(
                        'Hello! Register to get started',
                        style: TextStyles.getHeadline1(),
                      ),
                      Gap(30),
                      NameTextFormField(
                        controller: cubit.nameController,
                        hintText: 'Username',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      Gap(15),
                      NameTextFormField(
                        controller: cubit.emailController,
                        hintText: 'Email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!isEmailValid(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      Gap(15),
                      NameTextFormField(
                        controller: cubit.passwordController,
                        obscureText: true,
                        hintText: 'Password',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      Gap(15),
                      NameTextFormField(
                        controller: cubit.passwordConfirmationController,
                        hintText: 'Confirm password',
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      Gap(30),
                      MainButton(
                        text: 'Register',
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.register();
                          }
                        },
                      ),
                      Gap(30),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
